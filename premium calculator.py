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
symbol = 'm[A-Z]{3,4}|MIR'
price = 'price":"\d+.\d+'
oraclePrice = 'Price":"\d+.\d'
innerPrice = '\d+.\d+'
symbols = re.findall(symbol, r.text)
ix=symbols.index('MIR')
prices = re.findall(price, r.text)
oraclePrices = re.findall(oraclePrice, r.text)
oraclePrices.insert(ix, f'''Price":"{prices[ix]}''')
for i in range(0,len(symbols)):
       u=float(re.findall(innerPrice,prices[i])[0])
       l=float(re.findall(innerPrice,oraclePrices[i])[0])
       premium=((abs(u-l))/l)*100
       print(symbols[i],"\n","Price : ",str(u)[:5],"|","Oracle Price : ",str(l)[:5],"|","Premium : ",str(premium)[:5],"%")
       print("-----------------------------------------------------------")
print('Donate MIR here <3','terra1tywrvyyl4ay68t89szl9gtlf3anawt6pnsxgsg')

       

