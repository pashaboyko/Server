import json
import pymysql.cursors
import os
import logg



'''
HOST = '127.0.0.1'
PORT = 3306
USER = 'root'
PASSWORD = 'lock172839465'
DB = 'product_new1'
CHARSET = 'utf8mb4'
CURSORCLASS = pymysql.cursors.DictCursor
'''

HOST = '127.0.0.1'
PORT = 3305
USER = 'root'
PASSWORD = '12345678'
DB = 'product_new1'
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
        data_dict = None
        try:

            with self.connection.cursor() as cursor:
                sql = "SELECT id_product_value,name,bordercode,price,photo,points  from product_new1.product_value where  bordercode =%s"
                cursor.execute(sql, (barcode))

                rv = cursor.fetchall()

                if cursor.rowcount > 1:
                    print("545")
                    raise self.TooManyObjects
                elif cursor.rowcount == 0:
                    print("34")
                    raise self.DoesNotExist
                else:
                    data_json = json.dumps(rv, ensure_ascii=False, separators=(',', ': '))
                    data_json = json.loads(data_json, encoding='UTF-8')
                    for data in data_json:
                        data_dict = data
                   # print(data)
                    #print(json.dumps(data, ensure_ascii=False, separators=(',', ': ')))

        except:
            log.exception('No search')

        return data_dict


    def search_user(self,email,password) :
        data_dict = None
        try:

            with self.connection.cursor() as cursor:

                sql = "SELECT * FROM product_new1.user WHERE email=%s AND password=%s"
                cursor.execute(sql, (email, password))

                rv = cursor.fetchall()



                if cursor.rowcount > 1:
                    print("545")
                    raise self.TooManyObjects
                elif cursor.rowcount == 0:
                    print("34")
                    raise self.DoesNotExist
                else:
                    data_json = json.dumps(rv, indent=4, ensure_ascii=False, separators=(',', ': '))
                    data_json = json.loads(data_json, encoding='UTF-8')
                    for data in data_json:
                        data_dict = data

        except:
            log.exception('No search')

        return data_dict
    
    def search_admin(self,barcode,password) :
        data_dict = None
        try:

            with self.connection.cursor() as cursor:

                sql = "SELECT * FROM product_new1.admin WHERE bordercode=%s AND password=%s"
                cursor.execute(sql, (barcode, password))

                rv = cursor.fetchall()



                if cursor.rowcount > 1:
                    #print("545")
                    raise self.TooManyObjects
                elif cursor.rowcount == 0:
                        sql = "SELECT * FROM product_new1.admin WHERE bordercode=%s"
                        cursor.execute(sql, barcode)
                        if cursor.rowcount != 0:
                            raise self.NotCorrectPassword
                        else:
                        #print("34")
                            raise self.DoesNotExist
                else:
                    data_json = json.dumps(rv, indent=4, ensure_ascii=False, separators=(',', ': '))
                    data_json = json.loads(data_json, encoding='UTF-8')
                    for data in data_json:
                        data_dict = data

        except:
            log.exception('No search')

        return data_dict


    def search_user_bool(self,barcode) -> bool:
        try:

            with self.connection.cursor() as cursor:

                sql = "SELECT * FROM product_new1.user WHERE bordercode=%s"
                cursor.execute(sql, (barcode))

                rv = cursor.fetchall()
                if cursor.rowcount > 0 :
                    return True
                else: return False

        except:
            log.exception('No search')
            return False

    def add_row_to_items(self,id_product_value,name,barcode,price, photo, id_category, id_subcategory, id_manufacturer, points, delivery_date, quantity):
        try:
            cursor = self.connection.cursor()
            print("Enter name: ")
            Name = input()
            print("Enter bordercode: ")
            Barr = input()
            
            sql = "Insert into product_new1.product_value(id_product_value, name, bordercode, price,id_category,id_subcategory, id_manufacturer, photo, points, delivery_date, quantity) " \
                  + " values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s) "

            cursor.execute(sql, (id_product_value,name,barcode, price, id_category, id_subcategory, id_manufacturer, photo, points, delivery_date, quantity))

            sql1 = "SELECT * FROM product_new1.product_value"
            cursor.execute(sql1)
            for row in cursor:
                print(row)

            connection.commit()

        finally:
            connection.close()

    def delete_row(self, barcode):
        try:
            cursor = self.connection.cursor()
            sql = "Delete from  product_new1.product_value where bordercode = %s"
            rowCount = cursor.execute(sql, (barcode))
            print("Deleted! ", rowCount, " rows")
            sql1 = "SELECT * FROM product_new1.product_value"
            cursor.execute(sql1)
            for row in cursor:
                print(row)
            connection.commit()
        finally:
            connection.close()

    class DoesNotExist(BaseException):
        pass

    class TooManyObjects(BaseException):
        pass

    def relative_subcategory(self, category):
        data_dict = {}
        try:
             with self.connection.cursor() as cursor:
                sql = "SELECT product_subcategory.id_subcategory, product_subcategory.name from product_new1.product_category,product_new1.product_subcategory where product_category.name = %s and product_subcategory.id_category=product_category.id_category"
                cursor.execute(sql, (category))
                rv = cursor.fetchall()
                
                if cursor.rowcount == 0:
                    print("34")
                    raise self.DoesNotExist
                else:
                    data_json = json.dumps(rv, ensure_ascii=False, separators=(',', ': '))
                    data_json = json.loads(data_json, encoding='UTF-8')
                    for data in data_json:
                        data_dict.update({data.get("id_subcategory") : data.get("name")})
                   # print(data)
                    #print(json.dumps(data, ensure_ascii=False, separators=(',', ': ')))

        except:
            log.exception('No search')
        return data_dict
    
    def manufacturer_list(self,category):
        data_dict = {}
        try:
             with self.connection.cursor() as cursor:
                sql = "SELECT product_manufacturer.id_manufacturer, product_manufacturer.name from product_new1.product_manufacturer, product_new1.product_category where product_category.name = %s and product_manufacturer.id_category=product_category.id_category"
                cursor.execute(sql, (category))
                rv = cursor.fetchall()
                
                if cursor.rowcount == 0:
                    print("34")
                    raise self.DoesNotExist
                else:
                    data_json = json.dumps(rv, ensure_ascii=False, separators=(',', ': '))
                    data_json = json.loads(data_json, encoding='UTF-8')
                    for data in data_json:
                        data_dict.update({data.get("id_manufacturer") : data.get("name")})
                   # print(data)
                    #print(json.dumps(data, ensure_ascii=False, separators=(',', ': ')))

        except:
            log.exception('No search')
        return data_dict
    
    def add_row_to_products(self,name,barcode,price,id_subcategory,id_manufacturer, points, delivery_date, quantity):
        try:
            with cursor = self.connection.cursor() as cursor:
                sql0 = "SELECT id_product_value,name,bordercode,price,photo,points  from product_new1.product_value where  bordercode =%s"
                cursor.execute(sql0, (barcode))

                rv = cursor.fetchall()
                elif cursor.rowcount != 0:
                    #print("34")
                    raise self.DoesNotExist
                sql = "Insert into product_new1.product_value(name, bordercode, price,id_subcategory, id_manufacturer, points, delivery_date, quantity) values (%s, %s, %s,  %s , %s, %s, %s, %s) "

                cursor.execute(sql, (name,barcode, price, id_subcategory, id_manufacturer,  points, delivery_date, quantity))

                sql1 = "SELECT * FROM product_new1.product_value where bordercode = %s"
                cursor.execute(sql1, (barcode))
                rv = cursor.fetchall()
                if cursor.rowcount > 1:
                    print("545")
                    raise self.TooManyObjects
                elif cursor.rowcount == 0:
                    print("34")
                    raise self.DoesNotExist
                else:
                    data_json = json.dumps(rv, ensure_ascii=False, separators=(',', ': '))
                    data_json = json.loads(data_json, encoding='UTF-8')
                    for data in data_json:
                        data_dict = data
                   # print(data)
                    #print(json.dumps(data, ensure_ascii=False, separators=(',', ': ')))

        except:
            log.exception('No search')

        return data_dict
            
    def search_barcode_moreinfo(self, barcode):
        data_dict = None
        try:
            with self.connection.cursor() as cursor:
                sql = "SELECT id_product_value, product_value.name,bordercode,price,photo,points, product_category.name as 'category' ,product_subcategory.name as 'subcategory' , product_manufacturer.name as 'manufacturer' ,delivery_date,quantity from product_new1.product_value , product_new1.product_category, product_new1.product_subcategory ,product_new1.product_manufacturer where product_value.id_category=product_category.id_category And product_value.id_manufacturer = product_manufacturer.id_manufacturer and product_value.id_subcategory = product_subcategory.id_subcategory and  product_value.bordercode =%s"
                cursor.execute(sql, (barcode))

                rv = cursor.fetchall()

                if cursor.rowcount > 1:
                    print("545")
                    raise self.TooManyObjects
                elif cursor.rowcount == 0:
                    print("34")
                    raise self.DoesNotExist
                else:
                    data_json = json.dumps(rv, ensure_ascii=False, separators=(',', ': '))
                    data_json = json.loads(data_json, encoding='UTF-8')
                    for data in data_json:
                        data_dict = data
                   # print(data)
                    #print(json.dumps(data, ensure_ascii=False, separators=(',', ': ')))

        except:
            log.exception('No search')

        return data_dict

    def product_info(self, barcode):
        data_dict = {}
        try:

            with self.connection.cursor() as cursor:
                sql = "SELECT  product_features.name as 'feature', product_features_value.value from product_new1.product_features_value, product_new1.product_features, product_new1.product_value where product_features_value.id_feature = product_features.id_feature and product_features_value.id_product = product_value.id_product_value and product_value.bordercode = %s"
                cursor.execute(sql, (barcode))
                rv = cursor.fetchall()
                if cursor.rowcount == 0:
                    print("34")
                    raise self.DoesNotExist
                else:
                    
                    data_json = json.dumps(rv, ensure_ascii=False, separators=(',', ': '))
                    data_json = json.loads(data_json, encoding='UTF-8')
                    for data in data_json:
                        data_dict.update({data.get("feature") : data.get("value")})
                   
                   # print(data)
                    #print(json.dumps(data, ensure_ascii=False, separators=(',', ': ')))

        except:
            log.exception('No search')
        return data_dict

def main():
    try:
        con = MySqlCon.get_instance()
        #print(con.search_user(email = "a.miron@gmail.com", password = "1"))
        #print(con.search_user_bool("276920834954"))
        #print(con.search_barcode('644832819197'))
        #print(con.search_barcode_moreinfo('644832819197'))
        #print(con.product_info('733749933993'))
        #print(con.search_admin(barcode = "855555555555", password = "secret1"))
        #print(con.relative_subcategory("одежда"))
        print(con.manufacturer_list("одежда"))

    except Exception:

        log.exception('Error connect to Mysql')
        pass







if __name__ == "__main__":

    log_directory = 'log'
    if not os.path.exists(log_directory):
        os.makedirs(log_directory)

    log=logg.setup_logging('MysqlCon')


    main()



