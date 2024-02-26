# This file is code to be run via SSH onto EC2 
# It will use EC2 to establish a connection to the AWS RDS Postgres instance built 

# first, connect via SSH (note ec2 ID can change if EC2 is torn down & rebuilt) 
ssh -i "retail_SSH_key.pem" ec2-user@ec2-3-10-88-184.eu-west-2.compute.amazonaws.com

# ensure psql is installed (ensure at least v.10 installed) 
sudo yum update
sudo amazon-linux-extras install postgresql10

# check with
psql --version # it should print the version back to you (install successful!)

# now, run a test connection (note endpoint will change when destroying/creating resources)
# note, `postgres`` is the default database name on first setup 
# format: psql -h <RDS endpoint> -U <username> -d <database> -p 5432
psql -h retail-rules-repo.ccbvanmnsy8j.eu-west-2.rds.amazonaws.com -U Retail_DE_Admin -d postgres -p 5432

# will then be prompted for the password
# then, PSQL command line will appear!

# postgres=>

# to exit / quit, use 
\q 

# back to the EC2 command line
# exit SSH 
exit
# Test complete! 