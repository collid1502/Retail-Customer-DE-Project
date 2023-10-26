# Project Data Sources

This document covers the process of sourcing / identifying / creating the data sources for this example project.<br>

### Using the `Faker` library

By using the `Faker` library, which can be installed into your virtual environment, you can easily create large(ish) amounts of synthetic data to be used in the project. <br>

#### buildCustomerSource.py

This python script generates a sample CSV file that will act as a master copy of the "customer base" for a fake retail company in the project. The CSV will be placed into AWS S3 at the start of the project, to mimic a data lake that has daily snapshots of a customer database table. You can see the different types of fake data that get created within the script, but items such as Names, DOBs, job, postcode, email etc. are all included.

#### buildTransactions.py

This python script can be used to generate transaction data. The idea is to create daily transaction files, which replicate back to customers and their purchases from a provided product list
