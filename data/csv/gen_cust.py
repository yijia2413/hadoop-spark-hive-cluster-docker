#coding: utf8

import names
from faker import Faker
from random import randint
from datetime import datetime
import random

"""
name                    string
gender                  int
address                 string
zip                     int
signdate                string
status                  int
level                   int
campaign                int
linkedwithapps          int
"""

dst_file = 'cust1.csv'
num_lines = 1000000
fake = Faker()

def gen_date():
    year = random.randint(2007, 2016)
    month = random.randint(1, 12)
    day = random.randint(1, 28)
    return datetime(year, month, day).strftime('%m/%d/%Y')

with open(dst_file, 'ab+') as f:
    for i in xrange(num_lines):
        id = i
        name = names.get_full_name().encode('utf8')
        gender = randint(0, 1)
        address = fake.address().encode('utf8')\
                .split('\n')[0].replace(',', ' ')
        zip = randint(1009, 99999)
        signdate = gen_date()
        status = randint(0,1)
        level = randint(0,9)
        campaign = randint(1, 5)
        linkedwithapps = randint(0,1)

        full = '{},{},{},{},{},{},{},{},{},{}\n'.format(id,
                name, gender, address, zip, signdate, status,
                level, campaign, linkedwithapps)

        f.write(full)
