import json
import pymysql.cursors
import os
import logg
import jwt
from datetime import datetime, timedelta
from os import getenv


JWT_SECRET = 'secret'
JWT_ALGORITHM = 'HS256'
JWT_EXP_DELTA_SECONDS = 20



HOST_MYSQL = '127.0.0.1'
PORT_MYSQL = 3306
USER_MYSQL = 'root'
PASSWORD_MYSQL = 'lock172839465'
DB_MYSQL = 'product_new1'
CHARSET_MYSQL = 'utf8mb4'
CURSORCLASS_MYSQL = pymysql.cursors.DictCursor

'''
HOST_MYSQL = '127.0.0.1'
PORT_MYSQL = 3305
USER_MYSQL = 'root'
PASSWORD_MYSQL = '12345678'
DB_MYSQL = 'product_new1'
CHARSET_MYSQL = 'utf8mb4'
CURSORCLASS_MYSQL = pymysql.cursors.DictCursor
'''



class MySqlCon:

    _instance = None

    @staticmethod
    def get_instance():
        if MySqlCon._instance is None:
            MySqlCon._instance = MySqlCon()
        return MySqlCon._instance

    def __init__(self):

        self._mysql_con = {
        "host": getenv("HOST_MYSQL", HOST_MYSQL),
        "port": getenv("PORT_MYSQL", PORT_MYSQL),
        "user": getenv("USER_MYSQL", USER_MYSQL),
        "password": (getenv("PASSWORD_MYSQL", PASSWORD_MYSQL)),
        "db": getenv("DB_MYSQL", DB_MYSQL),
        "charset": getenv("CHARSET_MYSQL", CHARSET_MYSQL),
        "cursorclass": getenv("CURSORCLASS_MYSQL", CURSORCLASS_MYSQL),
        }
        
        self.log = logg.get_class_log(self)

        self.log.debug("Trying to connect to My SQL {host}:{port}/{db}" , extra=self._mysql_con)
        self.connection= pymysql.connect(**self._mysql_con)
        self.log.info("Successfully connect to My SQL {host}:{port}/{db}" , extra=self._mysql_con)


    def search_barcode(self, barcode):
        data_dict = None
        try:
            with self.connection.cursor() as cursor:
                sql = "SELECT id_product_value,name,bordercode,price,photo,points  from product_new1.product_value where  bordercode =%s"
                cursor.execute(sql, (barcode))

                rv = cursor.fetchall()

                if cursor.rowcount > 1:
                    raise self.TooManyObjects

                elif cursor.rowcount == 0:
                    raise self.DoesNotExist


                else:
                    data_json = json.dumps(rv, ensure_ascii=False, separators=(',', ': '))
                    data_json = json.loads(data_json, encoding='UTF-8')
                    for data in data_json:
                        data_dict = data
                   # print(data)
                    #print(json.dumps(data, ensure_ascii=False, separators=(',', ': ')))

        except:
            log.exception('Error on SELECT product by barcode : {barcode}',extra={'barcode' : barcode})
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
        
    def write_token(self, email, password, token):
        try:

            with self.connection.cursor() as cursor:
                    sql1="UPDATE product_new1.user SET token=%s where user.email=%s AND user.password=%s"
                    cursor.execute(sql1,(token,email, password))
                    self.connection.commit()
        except:
            log.exception('No search')

        return "ok"
    
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
    
    def checkbarcode(self,barcode):
        try:
            with self.connection.cursor() as cursor:
                sql0 = "SELECT *  from product_new1.product_value where  bordercode =%s"
                cursor.execute(sql0, (barcode))
                rv = cursor.fetchall()
                if cursor.rowcount > 0:
                    raise self.DoesNotExist
        except:
            log.exception('has barcode')
            raise Exception("has barcode")


    def rowcount(self):
        try:
            with self.connection.cursor() as cursor:
                sql0 = "SELECT *  from product_new1.product_value"
                cursor.execute(sql0)
                rv = cursor.fetchall()
                if cursor.rowcount == 0:
                    raise self.DoesNotExist
                return {'rowcount' : str(cursor.rowcount)}    
        except:
            log.exception('no row')
            raise Exception("no row")


    def listProduct(self, startLimit : int, countProduct : int):
        try:
            data_dict = {}
            print ("sdncjksnadckjnkadsjcnksdanjkcnkjsdancjknds")
            print(startLimit)
            print(countProduct)
            with self.connection.cursor() as cursor:
                print ("sdncjksnadckjnkadsjcnksdanjkcnkjsdancjknds")

                sql0 = "SELECT id_product_value, product_value.name,bordercode,price,photo,points, product_category.name as 'category' ,product_subcategory.name as 'subcategory' , product_manufacturer.name as 'manufacturer' ,delivery_date,quantity from product_new1.product_value , product_new1.product_category, product_new1.product_subcategory ,product_new1.product_manufacturer where product_value.id_category=product_category.id_category And product_value.id_manufacturer = product_manufacturer.id_manufacturer and product_value.id_subcategory = product_subcategory.id_subcategory limit %s,%s "
                cursor.execute(sql0, (int(startLimit),int(countProduct)))
                rv = cursor.fetchall()
    
                if cursor.rowcount == 0:
                    raise self.DoesNotExist
                else:
                    data_json = json.dumps(rv, ensure_ascii=False, separators=(',', ': '))
                    data_json = json.loads(data_json, encoding='UTF-8')
                    for data in data_json:
                        print(data)
                        data_dict.update({data.get("id_product_value") : data})
                    print (data_dict)    
        except:
            log.exception('no row')
            raise Exception("no row") 

        return data_dict           
        

    def add_row_to_products(self,name,barcode,price,id_subcategory,id_manufacturer, delivery_date, quantity):
        try:
            with self.connection.cursor() as cursor:
                MySqlCon.get_instance().checkbarcode(barcode)
                sql = "Insert into product_new1.product_value(name, bordercode, price,id_subcategory, id_manufacturer, delivery_date, quantity) values (%s, %s, %s, %s, %s, %s, %s) "

                cursor.execute(sql, (name,barcode, price, id_subcategory, id_manufacturer, delivery_date, quantity))
                self.connection.commit()

                '''sql1 = "SELECT * FROM product_new1.product_value where bordercode = %s"
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
                    #print(json.dumps(data, ensure_ascii=False, separators=(',', ': ')))'''

        except:
            log.exception('No search')
        return "ok"

    def add_features_value(self, value, id_feature, barcode):
        try:
            with self.connection.cursor() as cursor:
            
                
               
                sql = "Insert into product_new1.product_features_value(value, id_feature, id_product) values (%s, %s, (SELECT product_value.id_product_value from product_new1.product_value where product_value.bordercode = %s)) "

                cursor.execute(sql, (value,id_feature, barcode))
                self.connection.commit()

                '''sql1 = "SELECT * FROM product_new1.product_value where bordercode = %s"
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
                    #print(json.dumps(data, ensure_ascii=False, separators=(',', ': ')))'''

        except:
            log.exception('No search')
        return "added"
            
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
    
    def get_receipt(self, bar, summ, date, id_user):
        try:
            with self.connection.cursor() as cursor:
                
                x = bar.split()
                sql1="INSERT INTO product_new1.check_value(id_user, sum, date) values (%s, %s, %s)"   
                cursor.execute(sql1, (id_user,summ, date))
                self.connection.commit()
                sql2 ="SELECT id_check_value from product_new1.check_value where check_value.date = %s"
                cursor.execute(sql2, (date))
                rv = cursor.fetchall()
                if cursor.rowcount > 1:
                    raise self.TooManyObjects
                elif cursor.rowcount == 0:
                    raise self.DoesNotExist
                else:
                    data_json = json.dumps(rv, ensure_ascii=False, separators=(',', ': '))
                    data_json = json.loads(data_json, encoding='UTF-8')
                    for data in data_json:
                        data_dict = data
                for line in x:
                    sql = "insert into product_new1.check_product_value (id_check_value, barcode) values (%s,%s)"
                    val = int(line)
                    print(val)
                    cursor.execute(sql, (data_dict['id_check_value'],val))
                    self.connection.commit()
        except:
            log.exception('No search')
        return "ok"
        
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

    def checkbarcode_true(self,barcode):
        with self.connection.cursor() as cursor:
            sql0 = "SELECT *  from product_new1.product_value where  bordercode =%s"
            cursor.execute(sql0, (barcode))
            rv = cursor.fetchall()
            if cursor.rowcount == 0:
                    #print("34")
                raise self.Error
            else: 
                return "ok"

    def delete(self, barcode):
        try:
            print(barcode)
            with self.connection.cursor() as cursor:
                sql = "Delete from  product_new1.product_value where bordercode = %s"
                cursor.execute(sql, (barcode))
                self.connection.commit()
        except:
            log.exception('No search')
        return "ok"
    
    def edit_products(self,id_product,name,price,id_category,id_subcategory,id_manufacturer, photo, points, delivery_date,quantity):
        try:
            with self.connection.cursor() as cursor:
                
                sql = "UPDATE product_new1.product_value SET product_value.name = %s, product_value.price = %s, product_value.id_category = %s,product_value.id_subcategory = %s,product_value.id_manufacturer = %s, product_value.photo = %s, product_value.points = %s, product_value.delivery_date = %s,product_value.quantity = %s where product_value.id_product_value = %s"

                cursor.execute(sql, (name,price,id_category,id_subcategory,id_manufacturer, photo, points, delivery_date,quantity, id_product))
                self.connection.commit()
        except:
            log.exception('No search')
        return "ok"

    def edit_features_value(self,value, id_feature, id_product):
        try:
            with self.connection.cursor() as cursor:
            
                sql = "UPDATE product_new1.product_features_value SET product_features_value.value = %s where product_features_value.id_product=%s AND product_features_value.id_feature = %s"
                cursor.execute(sql, (value,id_product,id_feature))
                self.connection.commit()

        except:
            log.exception('No search')
        return "added"

    def close(self):
        try:
            self.log.debug("Trying to close conection -> {host}:{port}/{db}" , extra=self._mysql_con)
            self.connection.close()
            self.log.debug("Successfully closed conection -> {host}:{port}/{db}" , extra=self._mysql_con)

        except:
            log.exception("Error with clossing conection {host}:{port}/{db}" , extra=self._mysql_con)

    
def main():
    try:
        con = MySqlCon.get_instance()
        #print(con.search_user("re@gmail.com", "secret1"))
        #print(con.search_user_bool("276920834954"))
        #print(con.search_barcode('644832819197'))
        #print(con.search_barcode_moreinfo('644832819197'))
        #print(con.product_info('733749933993'))
        #print(con.search_admin(barcode = "855555555555", password = "secret1"))
        #print(con.relative_subcategory("одежда"))
        #print(con.manufacturer_list("одежда"))
        #print(con.add_row_to_products('ddddd','838388338389',40.0,10,14, '11.03.2020', 20))
        #print(con.add_features_value('0','1','838388338382'))
        #print(con.listProduct('0','10'))
        #con.edit_features_value()
        #con.delete('5645')
        #print(con.get_receipt('644832819197 438233939273 437628788237', 5000, '15.05.2020 13:07:23'))
        print(con.write_token("re@gmail.com", "secret1","1234567"))
    except Exception:

        log.exception('Error connect to Mysql')
        pass







if __name__ == "__main__":

    log_directory = 'log'
    if not os.path.exists(log_directory):
        os.makedirs(log_directory)

    log=logg.setup_logging('MysqlCon')


    main()



