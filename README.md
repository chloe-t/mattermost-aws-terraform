# mattermost-aws-terraform

You will find ALL NEEDED STEPS to deploy your mattermost instance to AWS EC2 using Terraform here. 
Instructions look very long, but don't worry, manual steps are quick, they are just really detailed so you can feel confortable to execute all of them. 

You ready?

1. [Pre-requisites](./docs/1_pre-requisites.md)
2. [Deploy](./docs/2_deploy.md) 
3. [Setup Server](./docs/3_setup-server.md)
4. [Maintenance](./docs/4_maintenance.md)
5. [Miscellaneous](./docs/5_miscellaneous.md)

<br>
<br>


# What wil be deployed? 
In this architecture:

    - There is an AWS VPC (Virtual Private Cloud) that is isolated from the Internet by default.
    - The VPC contains two subnets: a public subnet and a private subnet.
    - The public subnet is connected to the Internet via an Internet Gateway (IGW).
    - There is an EC2 instance in the public subnet that is hosting a Docker container.
    - The Docker container is exposed on port 8065 and is accessible from the Internet thanks to the security group allowing this rule.
    - The public subnet is associated with a routing table that maps traffic to the IGW. This allows traffic destined for the Internet to be routed out of the VPC through the IGW.
    - The private subnet can contain other resources, such as additional EC2 instances, that are not accessible from the Internet.

All those ressources are automatically provisionned by terraform. 

Schema of ressources that will be deployed: 

                                  ┌────────────────────────────────┐
                                  │             Internet           │
                                  └────────────────────────────────┘
                                               │
                                               │
                                               ▼
                       ┌──────────────────────────────────┐
                       │           IGW (Internet Gateway) │
                       └──────────────────────────────────┘
                                               │
                                               │
                                               ▼
              ┌────────────────────────────────────────────────┐
              │                    VPC                         │
              │                                                │
              │  ┌────────────────────┐   ┌──────────────────┐ │
              │  │    Public Subnet   │   │  Private Subnet  │ │
              │  └────────────────────┘   └──────────────────┘ │
              │              │                            │    │
              │              │                            │    │
              │              │                            │    │
              │              ▼                            ▼    │
              │  ┌──────────────────┐       ┌────────────────┐ │
              │  │    EC2 Instance  │       │     Other EC2  │ │
              │  │   (Docker Host)  │       │   Instances    │ │
              │  └──────────────────┘       └────────────────┘ │
              │              │                            │    │
              │              │                            │    │
              │              │                            │    │
              │              ▼                            ▼    │
              │  ┌──────────────────┐       ┌────────────────┐ │
              │  │ Docker Container │       │      ...       │ │
              │  │  (Exposed on     │       │                │ │
              │  │   port 8065)     │       │                │ │
              │  └──────────────────┘       └────────────────┘ │
              └────────────────────────────────────────────────┘



More informations about Mattermost server deployment [here](https://docs.mattermost.com/guides/deployment.html)


<!-- # Terraform folder organisation: 
https://stackoverflow.com/questions/69323678/terraform-folder-structure -->
# FAQ

- WHERE IS MY SERVER URL DISPLAYED ONCE TERRAFORM ENDS DEPLOYING?

[Answer here](/docs/2_deploy.md#access-the-instance-from-browser)

- NOTHING HAPPENS WHEN I REACH THE PUBLIC URL OF MY INSTANCE

[Don't forget to add the port at the end of your URL](/docs/2_deploy.md#access-the-instance-from-browser)

- I CAN'T FIND MY INSTANCE ON EC2 DASHBOARD

[Check that the console is in the correct AWS region](/docs/2_deploy.md#access-the-instance-from-browser)
