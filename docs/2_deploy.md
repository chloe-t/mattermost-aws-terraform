# Deploy

## Trigger Github Action pipeline 
### Trigger with no code updates
https://docs.github.com/en/actions/managing-workflow-runs/manually-running-a-workflow

### Trigger when merge to master

## What is Terraform doing
### tf state
Inside your Terraform cloud account is your Terraform State file. This file describes the current state of your ressources (which one are created, where, how, ... ).


### What happends when terraform is launched: 
1. Terraform will look for the tfstate to determine differences between what is already deployed and what needs to be deployed. 
If no tfstate is created, then it will initialize it. 
2. Depending on the differences between what is asked and what's deployed, terraform will plan action to do (see terraform --plan)
3. Terraform apply

### The output
