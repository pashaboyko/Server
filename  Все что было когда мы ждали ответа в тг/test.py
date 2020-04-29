import pymysql.cursors
import json
import connections
connection = connections.getConnection()
# Подключиться к базе данных.
#print("connect successful!")
def search():
    try:

        with connection.cursor() as cursor:


            bar = '234556549830'
            sql="SELECT * FROM product.food WHERE bordercode=%s"
            cursor.execute(sql, (bar))
            s=[]
            
         #print("cursor.description: ", cursor.description)
            rv = cursor.fetchall()
            
            print (json.dumps(rv,indent=4,ensure_ascii=False,separators=(',', ': ')))
            
            for row in cursor:
                s.append(row)
                print(row)
                

    except:
        print("An exception occurred")
    print (s)
    return json.dumps(rv,indent=7,ensure_ascii=False,separators=(',', ': '))
    
search()

def add_row():
    try:
        cursor = connection.cursor()
        print("Enter name: ")
        Name = input()
        print("Enter bordercode: ")
        Barr=input()
        sql = "Insert into product_new.food(name, bordercode, price, photo, day, month, year) " \
              + " values (%s, %s, %s, %s, %s, %s, %s) "

        cursor.execute(sql, (Name, Barr, 2000, '0.jpg',12,3,2020))

        sql1 = "SELECT * FROM product_new.food"
        cursor.execute(sql1)
        for row in cursor:
            print(row)

        connection.commit()

    finally:
        connection.close()


def delete_row():
    try:
        cursor = connection.cursor()
        bar = '8197366721'
        sql = "Delete from  product_new.food where bordercode = %s"
        rowCount = cursor.execute(sql, (bar))
        print("Deleted! ", rowCount, " rows")
        sql1 = "SELECT * FROM product_new.food"
        cursor.execute(sql1)
        for row in cursor:
            print(row)
        connection.commit()
    finally:
        connection.close()
#delete_row()

