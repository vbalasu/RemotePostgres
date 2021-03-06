
# RemotePostgres

RemotePostgres is a way to easily access a remote Postgres database and perform queries, including SELECT and INSERT operations

See below for examples of how to use


```python
from remote_postgres import RemotePostgres
import mysecrets
db = RemotePostgres(f'postgres://{mysecrets.pg_user}:{mysecrets.pg_password}@{mysecrets.pg_host}:{mysecrets.pg_port}/{mysecrets.pg_database}')
```


```python
db.get_counts()
```




    [{'tmp_1347844423': 0}, {'Employee': 0}, {'tmp_1170648801': 0}]




```python
db.con.cursor().execute("""CREATE TABLE "Shipper" ("Id" INTEGER, "CompanyName" TEXT, "Phone" TEXT)  """)
```


```python
new_records = [{'Id': 1, 'CompanyName': 'Speedy Express', 'Phone': '(503) 555-9831'},
 {'Id': 2, 'CompanyName': 'United Package', 'Phone': '(503) 555-3199'},
 {'Id': 3, 'CompanyName': 'Federal Shipping', 'Phone': '(503) 555-9931'},
 {'Id': 4, 'CompanyName': 'Speedy Express', 'Phone': '(503) 555-9831'},
 {'Id': 5, 'CompanyName': 'United Package', 'Phone': '(503) 555-3199'},
 {'Id': 6, 'CompanyName': 'Federal Shipping', 'Phone': '(503) 555-9931'}]
```


```python
db.insert('Shipper', new_records)
```


```python
db.select('SELECT * FROM "Shipper"')
```




    [{'Id': 1, 'CompanyName': 'Speedy Express', 'Phone': '(503) 555-9831'},
     {'Id': 2, 'CompanyName': 'United Package', 'Phone': '(503) 555-3199'},
     {'Id': 3, 'CompanyName': 'Federal Shipping', 'Phone': '(503) 555-9931'},
     {'Id': 4, 'CompanyName': 'Speedy Express', 'Phone': '(503) 555-9831'},
     {'Id': 5, 'CompanyName': 'United Package', 'Phone': '(503) 555-3199'},
     {'Id': 6, 'CompanyName': 'Federal Shipping', 'Phone': '(503) 555-9931'}]




```python
cur = db.con.cursor()
cur.execute("""DELETE FROM "Shipper" WHERE "Id" > 3""")
db.con.commit()
```


```python
db.generate_create_table('Shipper', new_records)
```




    'CREATE TABLE "Shipper" ("Id" TEXT, "CompanyName" TEXT, "Phone" TEXT)'




```python
db.con.cursor().execute("""DROP TABLE "Shipper" """)
db.con.commit()
```


```python
del db    # Close the connection
```
