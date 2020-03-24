import pymysql.cursors
import connections
connection = connections.getConnection()
# Подключиться к базе данных.
#print("connect successful!")
def search():
        with connection.cursor() as cursor:
         bar = '2222222222222'
         sql = "SELECT * FROM product_new.food WHERE bordercode=%s"
         if(cursor.execute(sql, (bar)) == True):
           # bar = '234556549830'
            #sql="SELECT * FROM product_new.food WHERE bordercode=%s"
            #cursor.execute(sql, (bar))
         #print("cursor.description: ", cursor.description)
            for row in cursor:
                print(row)
         else:
            sql = "SELECT * FROM product_new.clothes WHERE bordercode=%s"
            if(cursor.execute(sql, (bar)) == True):
                for row in cursor:
                  print(row)

search()

def add_row():
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

#add_row()

def delete_row():
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
#delete_row()
connection.close();