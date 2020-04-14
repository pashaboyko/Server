## Server

![ScanPay](Img1.png)

```
Server-based on aiohttp lib

```
___
## Functional :

- Response to user requests :  
```
        - registration 
        - authorization
        - barcode request
        - edit item on database
        - delete item on database
        - add new item to database
```
- Unique token generation
- Working with database : 
```
        - conect 
        - requests to database
        - read response from database
```        
- Send email at registation 

---
## Start with python 
```
start python file with parameters or config file**
```

### Parameters:
- Port
- Host

### Example:
``` 
python3 -m server.py localhost 8080 

```
```
python3 -m configfile.yaml
```

---

##  Start with docker (or docker-compose)

Dockerfile  based  on image python:3-slim or python:3-alpine










