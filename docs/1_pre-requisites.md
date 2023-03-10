
# Manual steps before launching deployment
1. [Terraform Cloud configuration](#terraform-cloud-configuration)
2. [AWS Configurations](#aws-configurations)
3. [Github Secrets](#github-secrets)

<br>
<br>

## Terraform Cloud configuration
Terraform Cloud is free for individuals, up to 5 users on the same account.
Terraform Cloud is a managed solution served by Hashicorp. It supplies an [UI](https://app.terraform.io/) , offers remote state management (no need to bother with tf state management) and also provide private module registry.


1 - [Create an account](https://app.terraform.io/session?redirect_to=%2Fapp%2F)

You can use your github account to create your Terraform Cloud account, for that, on the sign-in page, select `Continue with HCP account`, then select `Sign in with GitHub`.

2 - [Create an Organization](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/organizations#creating-organizations)

3 - [Create an API token](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/api-tokens#organization-api-tokens)

Save this token, you will need to save it as a Github secret.

4 - Update [main.tf](./main.tf) file ( located at the root level of this repo) with the terraform organisation name and workspace name you've created: 
```
  backend "remote" {
    organization = "<your_organization_name>" 
    workspaces {
      name = "<your_workspace_name>"
    }
  }
```

**NOTE**

Organization name and workspace name can have the same value, as long as it corresponds to your Terraform Cloud account. 

---

<br>
<br>

## AWS Configurations
### Create your access key
- Log into your AWS Account
- Go to [IAM (identity service) page](https://console.aws.amazon.com/iam/)
- On the Navigation Menu, choose `Users`
- If you don't see any users or if the user you need doesn't exists: 
    - Select `Add User` at the top right of the page
    - Choose a name
    - If the user you are creating is only meant to be used to deploy those ressources, it doesn't need the access to the AWS Management Console, so don't check the box.
    - Click on `Next`
    - Configure security policies using `Attach policies directly`. (if you don't know which one to choose, it's not recommended for security reasons, but you may use `AdministratorAccess` in a first place.)
    - Click on `Next`
    - You'll land on a 'Review and create page'. Review displayed information, and validate them clicking `Create user`
- Select the user that we will use to create access key
- Go to `security_credentials` tab, scroll down to 'Access keys' section
- Click on `Create access key`
- Select `Application running outside AWS`
- Click `Next`
- Type the usage description of this key (ex: "Access key used by Teraform to deploy ressources to AWS")
- Click `Create access key`

---
**<span style="color:red">CAREFUL</span>**

You land on the page giving you your keys. Be careful, once you quit this page, __you won't be able to retrieve those keys again__. (In that case, delete this key and create another one.)

---


<br>

### Create an EC2 key-pair
You'll find a clear description of it [here](https://docs.aws.amazon.com/fr_fr/AWSEC2/latest/UserGuide/ec2-key-pairs.html)

**TLDR;**

This key-pair will enable you to connect securely to your EC2 instance via ssh from your local machine.

Follow those steps: 

- Open the [EC2 console](https://console.aws.amazon.com/ec2/)
- Ensure that the selected region is the same as the one you'll use for your deployment.
- On the left navigation panel select `Network & Security` > `Key Pairs`
- Click on the top right `Create key pair`
- The name of the key paie should be **`mttmst_kp`**
- Key pair type: **RSA**
- Private key file format: **.pem**
- Click on `Create key pair`

From there, your .pem file should automatically be downloaded. **<ins>Save it</ins>** for future use such as ssh connection to the instance that will be created. 


<br>
<br>
 

## Github Secrets
### secrets.AWS_ACCESS_KEY and secrets.AWS_SECRET_ACCESS_KEY
<span style="color:red">REQUIRED</span>

Follow [previous instructions](#create-your-access-key) to get the access key and secret access key linked to your aws account. 

Those access keys will be used to authenticate to your account so that ressources can be deployed from your AWS account.

### secrets.TF_API_TOKEN
<span style="color:red">REQUIRED</span>

The terraform cloud api token generated from [Terraform Cloud configuration](#terraform-cloud-configuration)


### secrets.AWS_REGION <!-- eu-west-1 -->
<span style="color:green">OPTIONAL</span> *default to <ins>eu-west-1</ins>*

Choose the region in which you want your ressources to be deployed into. 
Some regions are listed [here](https://docs.aws.amazon.com/general/latest/gr/rande.html) under "Regional endpoints". 

Example value: `eu-west-1` corresponding to Ireland endpoint.
