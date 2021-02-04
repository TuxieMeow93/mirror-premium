from datetime import datetime
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
now = datetime.now()

print("As of", now)
print("-----------------------------------------------------------")

#f = open("log.txt", "w")

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
       #f.write(str(texty))
       print(str(premium)[:5],"%", symbols[i],"|Terraswap: $",str(u)[:7],"|","Or                                                                                                                                                             acle Price: $",str(l)[:7], "| As of: ",now)
       #print("-----------------------------------------------------------")
#f.close()
print("-----------------------------------------------------------")
print("")
#print('\n\nDonate MIR here','terra1pcjv96xndll4eaymw6d68kdg9ycft2ez0xk403')
#print('And here terra1tywrvyyl4ay68t89szl9gtlf3anawt6pnsxgsg')
#print('Potential features to add: storing premium history,Premium+Mint+Stake ca                                                                                                                                                             lculator, IL, APR projections')
#print('credit: https://github.com/dev-bhaskar8/mirror-premium')
#print("-----------------------------------------------------------")
