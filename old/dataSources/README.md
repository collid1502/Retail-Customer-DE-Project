# Project Data Sources

This document covers the process of sourcing / identifying / creating the data sources for this example project.<br>

### Using the `Faker` library

By using the `Faker` library, which can be installed into your virtual environment, you can easily create large(ish) amounts of synthetic data to be used in the project. <br>

#### buildCustomerSource.py

This python script generates a sample CSV file that will act as a master copy of the "customer base" for a fake retail company in the project. The CSV will be placed into AWS S3 at the start of the project, to mimic a data lake that has daily snapshots of a customer database table. You can see the different types of fake data that get created within the script, but items such as Names, DOBs, job, postcode, email etc. are all included.

#### buildTransactions.py

This python script can be used to generate transaction data. The idea is to create daily transaction files, which replicate back to customers and their purchases from a provided product list

#### postcodeAPI/postcodeSearch.py

This script will use the open source https://www.doogal.co.uk to collect ONS (Office National Statistics UK) Postcode Data that will be used in thsi project

----------------------------

### Creating the files

Run the `buildCustomerSource.py` to generate a mock customer base. Code currently set to generate 140,000 customers. This need only be run once (and a seed value is left in to ensure the same customers are created on each run). The same copy can be placed into different days on an S3 bucket data lake (to come later) to mimic RAW data from a system being pumped into S3. <br>

As for transactions, run the `buildTransactions.py` file, ammending the date parameters if you plan to do multiple dates. I decided on running the script individually 3 times, to generate 2 separate CSVs of daily transactions.
<br>

For Postcodes, the plan here is to not create a file and upload to S3 from local. Instead, utilise AWS lambda to run a serverless function, detailed in `postcodeSearch.py` and then save this data to S3 for use in the end to end pipeline.

No data will be saved in the repo, as it's mock data that can be recreated with the scripts when needed.