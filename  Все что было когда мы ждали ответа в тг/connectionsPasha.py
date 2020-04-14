import pymysql.cursors

def getConnection():
    connection = pymysql.connect(host='127.0.0.1',
                                 port=3306,
                                 user='root',
                                 password='lock172839465',
                                 db='product',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    return connection
