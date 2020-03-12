<div id="notebook" class="border-box-sizing" tabindex="-1">

<div id="notebook-container" class="container">

<div class="cell border-box-sizing text_cell rendered">

<div class="prompt input_prompt">

</div>

<div class="inner_cell">

<div class="text_cell_render border-box-sizing rendered_html">

RemotePostgres
================================================

</div>

</div>

</div>

<div class="cell border-box-sizing text_cell rendered">

<div class="prompt input_prompt">

</div>

<div class="inner_cell">

<div class="text_cell_render border-box-sizing rendered_html">

RemotePostgres is a way to easily access a remote Postgres database and
perform queries, including SELECT and INSERT operations

See below for examples of how to use

</div>

</div>

</div>

<div class="cell border-box-sizing code_cell rendered">

<div class="input">

<div class="prompt input_prompt">

In \[1\]:

</div>

<div class="inner_cell">

<div class="input_area">

<div class="highlight hl-ipython3">

    from remote_postgres import RemotePostgres
    import mysecrets
    db = RemotePostgres(f'postgres://{mysecrets.pg_user}:{mysecrets.pg_password}@{mysecrets.pg_host}:{mysecrets.pg_port}/{mysecrets.pg_database}')

</div>

</div>

</div>

</div>

</div>

<div class="cell border-box-sizing code_cell rendered">

<div class="input">

<div class="prompt input_prompt">

In \[2\]:

</div>

<div class="inner_cell">

<div class="input_area">

<div class="highlight hl-ipython3">

    db.get_counts()

</div>

</div>

</div>

</div>

<div class="output_wrapper">

<div class="output">

<div class="output_area">

<div class="prompt output_prompt">

Out\[2\]:

</div>

<div class="output_text output_subarea output_execute_result">

    [{'tmp_1347844423': 0}, {'Employee': 0}, {'tmp_1170648801': 0}]

</div>

</div>

</div>

</div>

</div>

<div class="cell border-box-sizing code_cell rendered">

<div class="input">

<div class="prompt input_prompt">

In \[3\]:

</div>

<div class="inner_cell">

<div class="input_area">

<div class="highlight hl-ipython3">

    db.con.cursor().execute("""CREATE TABLE "Shipper" ("Id" INTEGER, "CompanyName" TEXT, "Phone" TEXT)  """)

</div>

</div>

</div>

</div>

</div>

<div class="cell border-box-sizing code_cell rendered">

<div class="input">

<div class="prompt input_prompt">

In \[4\]:

</div>

<div class="inner_cell">

<div class="input_area">

<div class="highlight hl-ipython3">

    new_records = [{'Id': 1, 'CompanyName': 'Speedy Express', 'Phone': '(503) 555-9831'},
     {'Id': 2, 'CompanyName': 'United Package', 'Phone': '(503) 555-3199'},
     {'Id': 3, 'CompanyName': 'Federal Shipping', 'Phone': '(503) 555-9931'},
     {'Id': 4, 'CompanyName': 'Speedy Express', 'Phone': '(503) 555-9831'},
     {'Id': 5, 'CompanyName': 'United Package', 'Phone': '(503) 555-3199'},
     {'Id': 6, 'CompanyName': 'Federal Shipping', 'Phone': '(503) 555-9931'}]

</div>

</div>

</div>

</div>

</div>

<div class="cell border-box-sizing code_cell rendered">

<div class="input">

<div class="prompt input_prompt">

In \[5\]:

</div>

<div class="inner_cell">

<div class="input_area">

<div class="highlight hl-ipython3">

    db.insert('Shipper', new_records)

</div>

</div>

</div>

</div>

</div>

<div class="cell border-box-sizing code_cell rendered">

<div class="input">

<div class="prompt input_prompt">

In \[6\]:

</div>

<div class="inner_cell">

<div class="input_area">

<div class="highlight hl-ipython3">

    db.select('SELECT * FROM "Shipper"')

</div>

</div>

</div>

</div>

<div class="output_wrapper">

<div class="output">

<div class="output_area">

<div class="prompt output_prompt">

Out\[6\]:

</div>

<div class="output_text output_subarea output_execute_result">

    [{'Id': 1, 'CompanyName': 'Speedy Express', 'Phone': '(503) 555-9831'},
     {'Id': 2, 'CompanyName': 'United Package', 'Phone': '(503) 555-3199'},
     {'Id': 3, 'CompanyName': 'Federal Shipping', 'Phone': '(503) 555-9931'},
     {'Id': 4, 'CompanyName': 'Speedy Express', 'Phone': '(503) 555-9831'},
     {'Id': 5, 'CompanyName': 'United Package', 'Phone': '(503) 555-3199'},
     {'Id': 6, 'CompanyName': 'Federal Shipping', 'Phone': '(503) 555-9931'}]

</div>

</div>

</div>

</div>

</div>

<div class="cell border-box-sizing code_cell rendered">

<div class="input">

<div class="prompt input_prompt">

In \[7\]:

</div>

<div class="inner_cell">

<div class="input_area">

<div class="highlight hl-ipython3">

    cur = db.con.cursor()
    cur.execute("""DELETE FROM "Shipper" WHERE "Id" > 3""")
    db.con.commit()

</div>

</div>

</div>

</div>

</div>

<div class="cell border-box-sizing code_cell rendered">

<div class="input">

<div class="prompt input_prompt">

In \[8\]:

</div>

<div class="inner_cell">

<div class="input_area">

<div class="highlight hl-ipython3">

    db.generate_create_table('Shipper', new_records)

</div>

</div>

</div>

</div>

<div class="output_wrapper">

<div class="output">

<div class="output_area">

<div class="prompt output_prompt">

Out\[8\]:

</div>

<div class="output_text output_subarea output_execute_result">

    'CREATE TABLE "Shipper" ("Id" TEXT, "CompanyName" TEXT, "Phone" TEXT)'

</div>

</div>

</div>

</div>

</div>

<div class="cell border-box-sizing code_cell rendered">

<div class="input">

<div class="prompt input_prompt">

In \[9\]:

</div>

<div class="inner_cell">

<div class="input_area">

<div class="highlight hl-ipython3">

    db.con.cursor().execute("""DROP TABLE "Shipper" """)
    db.con.commit()

</div>

</div>

</div>

</div>

</div>

<div class="cell border-box-sizing code_cell rendered">

<div class="input">

<div class="prompt input_prompt">

In \[10\]:

</div>

<div class="inner_cell">

<div class="input_area">

<div class="highlight hl-ipython3">

    del db    # Close the connection

</div>

</div>

</div>

</div>

</div>

</div>

</div>
