# Deploy

## Trigger Github Action pipeline 

https://docs.github.com/en/actions/managing-workflow-runs/manually-running-a-workflow


## What is Terraform doing
### tf state
Inside your Terraform cloud account is your Terraform State file. This file describes the current state of your ressources (which one are created, where, how, ... ).


### What happends when **terraform-apply** is launched: 
1. Terraform will look for the tfstate to determine differences between what is already deployed and what needs to be deployed. 
If no tfstate is created, then it will initialize it. 
2. Depending on the differences between what is asked and what's deployed, terraform will plan action to do (see terraform --plan)
3. Terraform apply

### What happends when **terraform-destroy** is launched:
1. Terraform will look for ressources state in tf state
2. Terraform will destroy all ressources listed in tf state 

<span style="color:red">CAREFUL WITH THIS ACTION, ONCE RESSOURCES ARE DESTROYED, YOU CAN'T RETRIEVE DESTROYED DATA. </span>



