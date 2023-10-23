# use of the faker package to generate fake customer transaction data
# imports
import pandas as pd
from faker import Faker 
import datetime
from faker.providers import DynamicProvider, BaseProvider

# create the base Faker & seed it so as to remain constant 
fake = Faker(locale='en_GB') # set to GB locale for fake data creation (i.e Postcodes etc)




Faker.seed(12345) # seed with a random unique number 


