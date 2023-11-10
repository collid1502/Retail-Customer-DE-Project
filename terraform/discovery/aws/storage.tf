# Create S3 buckets, objects & load files from local
# lowercase & hyphens only allowed !!!
resource "aws_s3_bucket" "Retail_UseCase" {
  bucket = "retail-cust-storage"
  force_destroy = true  # Set to true to allow Terraform to destroy the bucket
}

# create an object that can store artifacts if needed 
resource "aws_s3_object" "artifacts" {
  bucket = aws_s3_bucket.Retail_UseCase.id
  key    = "artifacts/"
}

# create an object that can store code files if needed
resource "aws_s3_object" "code" {
  bucket = aws_s3_bucket.Retail_UseCase.id
  key    = "code/"
}

# create an object to store RAW data
resource "aws_s3_object" "raw_data" {
  bucket = aws_s3_bucket.Retail_UseCase.id
  key    = "raw_data/"
}

# create an object to store CLEAN data
resource "aws_s3_object" "clean_data" {
  bucket = aws_s3_bucket.Retail_UseCase.id
  key    = "clean_data/"
}

## Upload a file from local to the S3 bucket
## Upload RAW data for example project from local storage
resource "aws_s3_object" "txn1" {
  bucket = aws_s3_bucket.Retail_UseCase.bucket
  key    = "raw_data/transactions/20231004/txns.csv"
  source = "/home/collid/work/projects/data_engineering/customprojects/retailCompany_de_cloud/dataSources/transactions/2023104_txns.csv"  # Replace with the path to your local file
}

resource "aws_s3_object" "txn2" {
  bucket = aws_s3_bucket.Retail_UseCase.bucket
  key    = "raw_data/transactions/20231005/txns.csv"
  source = "/home/collid/work/projects/data_engineering/customprojects/retailCompany_de_cloud/dataSources/transactions/2023105_txns.csv"  # Replace with the path to your local file
}

resource "aws_s3_object" "txn3" {
  bucket = aws_s3_bucket.Retail_UseCase.bucket
  key    = "raw_data/transactions/20231006/txns.csv"
  source = "/home/collid/work/projects/data_engineering/customprojects/retailCompany_de_cloud/dataSources/transactions/2023106_txns.csv"  # Replace with the path to your local file
}

resource "aws_s3_object" "cust_db" {
  bucket = aws_s3_bucket.Retail_UseCase.bucket
  key    = "raw_data/cust_db/master_customers.csv"
  source = "/home/collid/work/projects/data_engineering/customprojects/retailCompany_de_cloud/dataSources/custDBfiles/customerMasterExtract.csv"  # Replace with the path to your local file
}
