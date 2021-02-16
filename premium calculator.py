import requests
import json
import pandas as pd
import time

query = """{
  query:
   assets { symbol prices{
    price
    oraclePrice
        }
    statistic{
    volume 
    liquidity
    apr
        }
  }
}"""

now = (time.strftime('%Y-%m-%d %H:%M'))

print (now)
print("----------------------------------------------------------")

#Request and Load the Data from API as a dictionary
url = 'https://graph.mirror.finance/graphql'
r = requests.post(url,json={'query': query})
data1 = json.loads(r.text)

#Convert to Pandas DataFrame and remove JSON Nesting
df = pd.DataFrame(data1)
df = pd.json_normalize(data1["data"]["query"])

#Rename Colums
df.rename(columns = {
    'symbol':'Symbol', 
    'prices.price':'Price', 
    'prices.oraclePrice':'Oracle Price',
    'statistic.volume':'Volume',
    'statistic.liquidity':'Liquidity', 
    'statistic.apr':'APR'}, 
    
    inplace = True
    )

#Format Data Types
df['Oracle Price'] = pd.to_numeric(df['Oracle Price'], errors = 'coerce')
df['Price'] = pd.to_numeric(df['Price'], errors = 'coerce')
df['Volume'] = pd.to_numeric(df['Volume'], errors = 'coerce')
df['Liquidity'] = pd.to_numeric(df['Liquidity'], errors = 'coerce')
df['Volume'] = df['Volume']/1000000
df['Liquidity'] = df['Liquidity']/1000000
df['APR'] = pd.to_numeric(df['APR'], errors = 'coerce')

#Additional Columns & Calculations
Premium = df['Price'] - df['Oracle Price']
df['Premium'] = Premium / df['Oracle Price']
df['Date Time'] = now

#Fill None Values with 0
df.fillna(0, inplace = True)

#Sort Columns
df.sort_values("Premium", inplace = True)

#Reorder Columns
first_cols = ['Premium']
last_cols = [col for col in df.columns if col not in first_cols]
df = df[first_cols+last_cols]

#Format Columns to Pretty
df['Price'] = df['Price'].map("${:,.2f}".format)
df['Oracle Price'] = df['Oracle Price'].map("${:,.2f}".format)
df['Premium'] = df['Premium'].map("{:.2%}".format)
df['Volume'] = (df['Volume'].astype(float)/1000000).round(2).astype(str) + ' M'
df['Liquidity'] = (df['Liquidity'].astype(float)/1000000).round(2).astype(str) + ' M'
df['APR'] = df['APR'].map("{:.2%}".format)

#See Ya!
df.to_csv("list1.csv", index = False)
df_pretty = df.to_string(index = False)

print(df_pretty)

print("----------------------------------------------------------")
print("")
