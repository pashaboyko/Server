import pymysql.cursors

def getConnection():
    connection = pymysql.connect(host='127.0.0.1',
                                 port=3305,
                                 user='root',
                                 password='12345678',
                                 db='product_new',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    return connection
