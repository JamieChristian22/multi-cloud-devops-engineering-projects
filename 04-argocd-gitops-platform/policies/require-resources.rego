package kubernetes.admission
violation[msg]{input.kind=="Deployment";c:=input.spec.template.spec.containers[_];not c.resources.requests.cpu;msg:=sprintf("container %s requires CPU request",[c.name])}
violation[msg]{input.kind=="Deployment";c:=input.spec.template.spec.containers[_];c.securityContext.allowPrivilegeEscalation!=false;msg:=sprintf("container %s must disable privilege escalation",[c.name])}
