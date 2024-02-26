# Creating a key-pair for SSH to EC2 from local machine

Start by opening your command line (in my case, an Ubuntu shell). <br>
You will need to have the AWS CLI installed for this. <br>

To create a key-pair for AWS EC2 interaction, we can use the code:
```
aws ec2 create-key-pair --key-name my-key-pair --query 'KeyMaterial' --output text > my-key-pair.pem
```
Replacing `my-key-pair` with the actual name you wish to call the key-pair. <br>
This command will save a private key in a file named `my-key-pair.pem`. <br>

**IMPORTANT** <br>
*Ensure you securely store the private key!! ideally a location with restricted access if youre on a shared space. Do NOT share to GitHub etc.*

Having crated the key-pair, provide permissions to the file <br>
```
chmod 400 my-key-pair.pem
```

You can now use the private key to securely connect to your EC2 instances. When launching EC2 instances, specify the key pair you've created during the instance launch process to enable SSH access. Be sure to keep your private key safe and never share it with anyone who should not have access to your EC2 instances