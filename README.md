# VPC Peering between Two AWS VPCs

## Description

This project demonstrates how to create a VPC peering connection between two AWS Virtual Private Clouds (VPCs) and verify the connection by deploying EC2 instances in each VPC. The goal is to establish private connectivity between the VPCs, allowing the instances to communicate with each other.

![image](https://github.com/user-attachments/assets/c727077e-6a8c-4459-9fe1-6f9ae6cb9fec)


## Prerequisites

Before starting, ensure you have the following:

- An AWS account with sufficient permissions to create VPCs, subnets, IGWs (Internet Gateways), VPC Peering, and EC2 instances.
- AWS CLI or AWS Management Console access.
- Basic understanding of AWS networking concepts.

## Steps

### 1. Create Two VPCs with Separate Subnets

- **VPC 1**: Create the first VPC (e.g., `VPC1`) with a unique CIDR block (e.g., `10.0.0.0/16`).
- **VPC 2**: Create the second VPC (e.g., `VPC2`) with a different CIDR block (e.g., `192.168.0.0/16`).
- **Subnets**: Create one or more subnets in each VPC. Ensure the subnets do not overlap.

### 2. Create Internet Gateways (IGWs) and Attach Them to the VPCs

- **IGW for VPC1**: Create an Internet Gateway and attach it to `VPC1`.
- **IGW for VPC2**: Create another Internet Gateway and attach it to `VPC2`.
- **Route Tables**: Update the route tables in both VPCs to route traffic destined for the internet through their respective IGWs.

### 3. Create the VPC Peering Connection

- **VPC Peering Request**: Initiate a VPC Peering connection from `VPC1` (requestor) to `VPC2` (acceptor).
- **Accept Peering Request**: Accept the VPC Peering request from `VPC2`.

### 4. Configure Route Tables for VPC Peering

- **Update Route Tables**: In each VPC, update the route tables to include routes for the CIDR block of the other VPC through the VPC Peering connection.
  - `VPC1` route table: Add a route to `192.168.0.0/16` (VPC2) via the VPC Peering connection.
  - `VPC2` route table: Add a route to `10.0.0.0/16` (VPC1) via the VPC Peering connection.

### 5. Launch EC2 Instances in Each VPC

- **EC2 in VPC1**: Launch an EC2 instance in one of the subnets of `VPC1`.
- **EC2 in VPC2**: Launch another EC2 instance in one of the subnets of `VPC2`.

### 6. Configure Security Groups

- **VPC1 Security Group**: Modify the security group for the EC2 instance in `VPC1` to allow inbound traffic from the CIDR block of `VPC2` (e.g., `192.168.0.0/16`).
- **VPC2 Security Group**: Similarly, modify the security group for the EC2 instance in `VPC2` to allow inbound traffic from the CIDR block of `VPC1` (e.g., `10.0.0.0/16`).

### 7. Test the VPC Peering Connection

- **Ping Test**: From the EC2 instance in `VPC1`, attempt to ping the private IP address of the EC2 instance in `VPC2`, and vice versa. If the peering is correctly configured, the pings should be successful, indicating that the VPCs can communicate over the peering connection.

## Conclusion

This README guides you through setting up a VPC peering connection between two VPCs and verifying the setup by testing communication between EC2 instances across the VPCs. This setup is fundamental in connecting isolated VPCs in different regions or accounts, enabling private and secure communication.
