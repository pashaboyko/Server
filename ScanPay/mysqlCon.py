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
                    raise self.TooManyObjects
                elif cursor.rowcount == 0:
                        sql = "SELECT * FROM product_new1.admin WHERE bordercode=%s"
                        cursor.execute(sql, barcode)
                        if cursor.rowcount != 0:
                            raise self.NotCorrectPassword
                        else:
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
            with self.connection.cursor() as cursor:
            #MySqlCon.get_instance().checkbarcode_true(barcode)
            sql = "Delete from  product_new1.product_value where bordercode = %s"
            cursor.execute(sql, (barcode))
            self.connection.commit()
        except:
            log.exception('No search')
        return "ok"
            

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
                    raise self.DoesNotExist
                else:
                    data_json = json.dumps(rv, ensure_ascii=False, separators=(',', ': '))
                    data_json = json.loads(data_json, encoding='UTF-8')
                    for data in data_json:
                        data_dict.update({data.get("id_manufacturer") : data.get("name")})
        except:
            log.exception('No search')
        return data_dict
    
    def checkbarcode(self,barcode):
        with self.connection.cursor() as cursor:
            sql0 = "SELECT *  from product_new1.product_value where  bordercode =%s"
            cursor.execute(sql0, (barcode))
            rv = cursor.fetchall()
            if cursor.rowcount == 1:
                raise self.Error
            else: 
                return "ok"
                
    def add_row_to_products(self,name,barcode,price,id_subcategory,id_manufacturer, delivery_date, quantity):
        try:
            with self.connection.cursor() as cursor:
                MySqlCon.get_instance().checkbarcode(barcode)
                sql = "Insert into product_new1.product_value(name, bordercode, price,id_subcategory, id_manufacturer, delivery_date, quantity) values (%s, %s, %s, %s, %s, %s, %s) "

                cursor.execute(sql, (name,barcode, price, id_subcategory, id_manufacturer, delivery_date, quantity))
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

    def add_features_value(self, value, id_feature, barcode):
        try:
            with self.connection.cursor() as cursor:
            
                sql = "Insert into product_new1.product_features_value(value, id_feature, id_product) values (%s, %s, (SELECT product_value.id_product_value from product_new1.product_value where product_value.bordercode = %s)) "

                cursor.execute(sql, (value,id_feature, barcode))
                self.connection.commit()
        except:
            log.exception('No search')
        return "added"
        
    def edit_features_value(self, id_feature_value, value, id_feature, id_product):
        try:
            with self.connection.cursor() as cursor:
            
                sql = "UPDATE product_new1.product_features_value SET product_features_value.value = %s, product_features_value.id_feature = %s, product_features_value.id_product= %s where product_features_value.id_feature_value=%s"
                cursor.execute(sql, (value,id_feature, id_product,id_feature_value))
                self.connection.commit()

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
        #print(con.manufacturer_list("одежда"))
        #print(con.add_row_to_products('ddddd','838388338389',40.0,10,14, '11.03.2020', 20))
        #print(con.add_features_value('1',1,'838388338382'))
        #print(con.checkbarcode('838388338382'))
        #print(con.edit_products(7, 'шампунь', '100', 4, 15, 20, '0.jpg', 2, '23.03.2020', 3))


    except Exception:

        log.exception('Error connect to Mysql')
        pass







if __name__ == "__main__":

    log_directory = 'log'
    if not os.path.exists(log_directory):
        os.makedirs(log_directory)

    log=logg.setup_logging('MysqlCon')


    main()



