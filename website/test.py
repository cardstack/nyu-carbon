import mysql.connector

mydb = mysql.connector.connect(

    host = "nnsgluut5mye50or.cbetxkdyhwsb.us-east-1.rds.amazonaws.com",
    user = "f61oe34ieryulbh6",
    passwd = "oqj8v5d5y37ituc4",
)

my_cursor = mydb.cursor()
my_cursor.execute("SHOW DATABASES")
for db in my_cursor:
    print(db)