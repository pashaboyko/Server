import json
import pymysql.cursors
import os
import logg




HOST = '127.0.0.1'
PORT = 3306
USER = 'root'
PASSWORD = 'lock172839465'
DB = 'product_new'
CHARSET = 'utf8mb4'
CURSORCLASS = pymysql.cursors.DictCursor

log=None


class MySqlCon:

    _instance = None

    @staticmethod
    def get_instance(host=HOST,
                     port=PORT,
                     user=USER,
                     password=PASSWORD,
                     db=DB,
                     charset=CHARSET,
                     cursorclass=CURSORCLASS):
        if MySqlCon._instance is None:
            MySqlCon._instance = MySqlCon(host, port, user, password , db , charset , cursorclass)
        return MySqlCon._instance

    def __init__(self, host, port,user, password , db , charset , cursorclass):
        self.connection= pymysql.connect(host=host,
                         port=port,
                         user=user,
                         password=password,
                         db=db,
                         charset=charset,
                         cursorclass=cursorclass)

    def search_barcode(self, barcode):
        data_json = None
        try:

            with self.connection.cursor() as cursor:

                sql = "SELECT * FROM product_new.food WHERE bordercode=%s"
                cursor.execute(sql, (barcode))

                rv = cursor.fetchall()

                data_json = json.dumps(rv, indent=4, ensure_ascii=False, separators=(',', ': '))

        except:
            log.exception('No search')

        return data_json



    def add_row_to_items(self,name,barcode, price, photo, day, month, year):
        try:
            cursor = self.connection.cursor()
            print("Enter name: ")
            Name = input()
            print("Enter bordercode: ")
            Barr = input()
            sql = "Insert into product_new.food(name, bordercode, price, photo, day, month, year) " \
                  + " values (%s, %s, %s, %s, %s, %s, %s) "

            cursor.execute(sql, (name,barcode, price, photo, day, month, year))

            sql1 = "SELECT * FROM product_new.food"
            cursor.execute(sql1)
            for row in cursor:
                print(row)

            connection.commit()

        finally:
            connection.close()

    def delete_row(self, barcode):
        try:
            cursor = self.connection.cursor()
            sql = "Delete from  product_new.food where bordercode = %s"
            rowCount = cursor.execute(sql, (barcode))
            print("Deleted! ", rowCount, " rows")
            sql1 = "SELECT * FROM product_new.food"
            cursor.execute(sql1)
            for row in cursor:
                print(row)
            connection.commit()
        finally:
            connection.close()



def main():
    try:
        con = MySqlCon.get_instance()
        print(con.search_barcode("345392902983"))

    except Exception:

        log.exception('Error connect to Mysql')
        pass



if __name__ == "__main__":

    log_directory = 'log'
    if not os.path.exists(log_directory):
        os.makedirs(log_directory)

    log=logg.setup_logging('Telegram-sender')


    main()



