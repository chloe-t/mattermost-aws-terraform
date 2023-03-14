# Maintenance

1. [Access VM Instance via console](#access-instance-via-console)
2. [Access VM Instance via ssh](#access-instance-via-ssh)
3. [Reboot your instance](#reboot-instance)


## Access instance via console
See [dedicated tutorial](/docs/2_deploy.md#access-the-instance-from-browser) 
## Access instance via ssh
See [dedicated tutorial](/docs/2_deploy.md#access-the-instance-from-ssh) 
## Reboot instance
To reboot the instance (restart it), follow those instructions: 
- Open the [EC2 console](https://console.aws.amazon.com/ec2/)
- Select your VM
- On the options displayed at the top of the page, click on `instance state`, then select `Reboot`

---
<span style="color:red">CAREFUL</span>

If you choose `Terminate`, it will destroy your VM, and all its content. 
If you want to temporarily stop your instance, choose `Stop Instance`
---
<!-- WARNING REBOOT/TERMINATE -->