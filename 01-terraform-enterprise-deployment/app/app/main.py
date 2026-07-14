import os,time,uuid
from fastapi import FastAPI,Response
from pydantic import BaseModel
from prometheus_client import Counter,Histogram,generate_latest,CONTENT_TYPE_LATEST
app=FastAPI(title="DevOps API",version=os.getenv("APP_VERSION","1.0.0")); started=time.time()
reqs=Counter("http_requests_total","requests",["method","path","status"]); latency=Histogram("http_request_duration_seconds","latency",["path"])
class Echo(BaseModel): message:str
@app.middleware("http")
async def observe(r,call_next):
 t=time.perf_counter();resp=await call_next(r);reqs.labels(r.method,r.url.path,str(resp.status_code)).inc();latency.labels(r.url.path).observe(time.perf_counter()-t);resp.headers["X-Request-ID"]=r.headers.get("X-Request-ID",str(uuid.uuid4()));resp.headers["X-Content-Type-Options"]="nosniff";return resp
@app.get("/")
def root():return {"service":"devops-api","version":os.getenv("APP_VERSION","1.0.0"),"environment":os.getenv("ENVIRONMENT","local"),"status":"running"}
@app.get("/healthz")
def health():return {"status":"ok"}
@app.get("/readyz")
def ready():return {"status":"ready","uptime_seconds":round(time.time()-started,2)}
@app.post("/api/v1/echo")
def echo(body:Echo):return {"message":body.message,"environment":os.getenv("ENVIRONMENT","local")}
@app.get("/metrics")
def metrics():return Response(generate_latest(),media_type=CONTENT_TYPE_LATEST)
