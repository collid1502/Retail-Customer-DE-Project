# ## Connecting to Doogal.co.uk ~ Postcode Lookup 
# This script collects postcodes & other metadata from the UK ONS
# provided as a service by Doogal. 
# open data portal through their endpoint

# key imports 
import polars as pl 

# here we list a subsection of metadata points we wish to obtain 
colsToRead = [
    "Postcode", "In Use?", "Latitude", "Longitude", "Country", "Constituency",
    "Introduced", "Terminated", "Region", 
    "Last updated", "Postcode area", "Postcode district"
]
# each country and its CSV URL 
countries = {
    "NI": r"https://www.doogal.co.uk/UKPostcodesCSV/?Search=BT&uprn=false",
    "England": r"https://www.doogal.co.uk/UKPostcodesCSV/?country=England&uprn=false",
    "Scotland": r"https://www.doogal.co.uk/UKPostcodesCSV/?country=Scotland&uprn=false",
    "Wales": r"https://www.doogal.co.uk/UKPostcodesCSV/?country=Wales&uprn=false"
}
# the UK is made up of 4 separate countries. As such, we will individually collect/read each CSV
# which is one per country, and append to a dataframe
data_NI = pl.read_csv(countries['NI'], columns=colsToRead)
data_Wales = pl.read_csv(countries['Wales'], columns=colsToRead)
data_Scotland = pl.read_csv(countries['Scotland'], columns=colsToRead)
data_England = pl.read_csv(countries['England'], columns=colsToRead) # will take the longest as is largest

dfs = [data_NI, data_Wales, data_Scotland, data_England]

# once all countries have been done union dataframes into one
postcodeData = pl.concat(dfs) 

# write df as parquet file to S3 location (for testing, local shared drive)
writeLocation = r"dataSources/postcodeAPI/UKpostcodes.parquet"
postcodeData.write_parquet(writeLocation, compression="snappy")

# end of process
exit(0)