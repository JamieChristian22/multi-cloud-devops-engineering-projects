# Multi-Cloud Architecture

## AWS
Dual-AZ VPC with two public and two private subnets, Internet Gateway, NAT Gateway, route tables, security group, and EC2.

## Azure
Resource Group, VNet, two public and two private subnets, NSG, public IP, NIC, and Linux VM.

## Google Cloud
Custom VPC, public/private subnets, Cloud Router, Cloud NAT, firewall rules, and Compute Engine VM.

| Environment | AWS | Azure | GCP |
|---|---|---|---|
| dev | 10.10.0.0/16 | 10.110.0.0/16 | 10.210.0.0/16 |
| staging | 10.20.0.0/16 | 10.120.0.0/16 | 10.220.0.0/16 |
| prod | 10.30.0.0/16 | 10.130.0.0/16 | 10.230.0.0/16 |
