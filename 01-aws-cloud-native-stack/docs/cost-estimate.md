# Cost Notes

The main recurring costs are Fargate task CPU/memory, the Application Load Balancer, NAT Gateway hourly and data-processing charges, CloudWatch ingestion, and public IPv4 usage. Development defaults use one task and one NAT gateway to reduce cost. Production uses two tasks and one NAT gateway per Availability Zone for stronger availability. Prices differ by region and change over time; use AWS Pricing Calculator before deployment and destroy the lab when evidence is complete.
