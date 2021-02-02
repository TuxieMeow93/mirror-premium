import requests
import json
import re

query = """{
  query: 
   assets { symbol prices{
    price
    oraclePrice
  	}
  }
}"""
url = 'https://graph.mirror.finance/graphql'
r = requests.post(url,json={'query': query})

symbol = 'm[A-Z]{3,4}'
price = 'price":"\d+.\d+'
oraclePrice = 'Price":"\d+.\d'
innerPrice = '\d+.\d+'

symbols = re.findall(symbol, r.text)
prices = re.findall(price, r.text)
del prices[1]
oraclePrices = re.findall(oraclePrice, r.text)

for i in range(0,len(symbols)):
       
       u=float(re.findall(innerPrice,prices[i])[0])
       l=float(re.findall(innerPrice,oraclePrices[i])[0])
       premium=((abs(u-l))/l)*100
       print(symbols[i],"|","Price : ",str(u)[:5],"|","Oracle Price : ",str(l)[:5],"|","Premium : ",str(premium)[:5],"%")


       

