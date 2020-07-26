RemotePostgres
==============

RemotePostgres is a way to easily access a remote Postgres database and
perform queries, including SELECT and INSERT operations

See below for examples of how to use

``` {.sourceCode .ipython3}
from remote_postgres import RemotePostgres
import mysecrets
db = RemotePostgres(f'postgres://{mysecrets.pg_user}:{mysecrets.pg_password}@{mysecrets.pg_host}:{mysecrets.pg_port}/{mysecrets.pg_database}')
```

``` {.sourceCode .ipython3}
db.get_counts()
```

``` {.sourceCode .ipython3}
db.con.cursor().execute("""CREATE TABLE "Shipper" ("Id" INTEGER, "CompanyName" TEXT, "Phone" TEXT)  """)
```

``` {.sourceCode .ipython3}
new_records = [{'Id': 1, 'CompanyName': 'Speedy Express', 'Phone': '(503) 555-9831'},
 {'Id': 2, 'CompanyName': 'United Package', 'Phone': '(503) 555-3199'},
 {'Id': 3, 'CompanyName': 'Federal Shipping', 'Phone': '(503) 555-9931'},
 {'Id': 4, 'CompanyName': 'Speedy Express', 'Phone': '(503) 555-9831'},
 {'Id': 5, 'CompanyName': 'United Package', 'Phone': '(503) 555-3199'},
 {'Id': 6, 'CompanyName': 'Federal Shipping', 'Phone': '(503) 555-9931'}]
```

``` {.sourceCode .ipython3}
db.insert('Shipper', new_records)
```

``` {.sourceCode .ipython3}
db.select('SELECT * FROM "Shipper"')
```

``` {.sourceCode .ipython3}
cur = db.con.cursor()
cur.execute("""DELETE FROM "Shipper" WHERE "Id" > 3""")
db.con.commit()
```

``` {.sourceCode .ipython3}
db.generate_create_table('Shipper', new_records)
```

``` {.sourceCode .ipython3}
db.con.cursor().execute("""DROP TABLE "Shipper" """)
db.con.commit()
```

``` {.sourceCode .ipython3}
del db    # Close the connection
```
