# Terraform - AWS VPC

This section looks at how to build a VPC on AWS with Terraform

**resource.tf** has the following code:

```
holder
```

### cidr_block 

The cidr_block parameter with the value "10.0.0.0/16" in the Terraform script is used to define the IP address range for the Virtual Private Cloud (VPC) being created. This is specified using Classless Inter-Domain Routing (CIDR) notation.

In CIDR notation, an IP address range is represented as an IP address followed by a forward slash and a prefix length. The IP address defines the network's base address, and the prefix length indicates how many bits of the address are fixed (the network part) and how many bits are available for host addresses.

In "10.0.0.0/16":

"10.0.0.0" is the base IP address of the VPC.
"/16" means that the first 16 bits of the address are the network part, leaving 32 - 16 = 16 bits for host addresses within the VPC.
This results in a VPC with a total of 2^16 (65,536) possible IP addresses that can be used for instances, subnets, and other resources within the VPC. The specific IP address range will range from 10.0.0.0 to 10.0.255.255.

You can adjust the cidr_block value to define the size and range of your VPC's IP address space according to your needs. Just ensure that it doesn't overlap with any other IP address ranges in your AWS account to prevent conflicts.

### DNS support & hostnames

In the script, both are set to TRUE for enable

The `enable_dns_support` attribute set to true is an option in AWS when creating a Virtual Private Cloud (VPC). When you enable DNS support for a VPC, it allows the instances (EC2 instances and other resources) within that VPC to resolve domain names and use DNS (Domain Name System) to communicate with resources on the internet and within the VPC itself

AWS also provides an option called `enable_dns_hostnames`, which, when set to true, allows instances in the VPC to have public DNS hostnames. Public DNS hostnames are helpful when you want to access instances on the internet using their fully qualified domain names (FQDN).

For example, with enable_dns_hostnames enabled, your EC2 instances can be reached using a domain name like "ec2-123-456-789-012.compute-1.amazonaws.com."

In addition to public DNS resolution, with DNS support enabled, your instances can also use DNS to resolve the private IP addresses of other resources within the same VPC, which is useful for internal communication.

In summary, setting enable_dns_support to true ensures that your VPC is DNS-enabled, allowing your instances to resolve both public and private domain names, making it easier for them to communicate with other resources using domain names rather than IP addresses. This is particularly useful for creating a more user-friendly and dynamic networking environment within your VPC

### Subnets 

Each subnet has its own IP address range, defined as a Classless Inter-Domain Routing (CIDR) block. For example, a subnet might be defined with a CIDR block like "10.0.0.0/24," which means it has 256 IP addresses (ranging from 10.0.0.0 to 10.0.0.255)

Subnets are tied to a single availability zone within the region. This association helps distribute resources and provides redundancy. If you want your application to be highly available, you can create resources in multiple subnets across different availability zones

Instances (such as EC2 instances) launched in a subnet can be assigned security groups that define stateful firewall rules, allowing you to control traffic to and from individual instances

**Use Cases:** Subnets allow you to organize and isolate your resources within the VPC. They are commonly used to separate different tiers of an application, such as web servers in a public subnet and database servers in a private subnet. Subnets also facilitate network segregation and help improve security.

Subnets are a fundamental component of VPC networking in AWS. They provide flexibility, scalability, and control over your network architecture, allowing you to design and deploy a wide range of applications and services in a secure and efficient manner
