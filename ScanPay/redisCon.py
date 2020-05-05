import redis
import logg
from os import getenv



REDIS_HOST = '192.168.99.106' 
REDIS_PORT = 6379 
REDIS_DB  = 0


class RedisCon :

    _instance = None

    @staticmethod
    def get_instance():
        if RedisCon._instance is None:
            RedisCon._instance = RedisCon()
        return RedisCon._instance

    def __init__(self):


        self.log = logg.get_class_log(self)

        redis_host = getenv('REDIS_HOST', REDIS_HOST)
        redis_port = int(getenv('REDIS_PORT', REDIS_PORT))

        self.log.debug('Trying to connect redis {host}:{port}', extra={'host': redis_host, 'port' : redis_port})
        #self.redis = redis.Redis(self._redis_con_param)
    
        self.redis = redis.Redis(host=redis_host, port=redis_port, db=0)
        self.log.info('Successfully connected redis {host}:{port}', extra={'host': redis_host, 'port' : redis_port})


    def setData(self, key , data , expire=None):
        self.redis.set(str("Server:id:"+str(key)) , data)
        if expire:
           self.redis.expire(str("Server:id:"+str(key)) ,expire)
        self.log.debug("Set Data on Redis with key={key} and data{data}", extra={'key' : key , 'data' : data})    


    def searchTocken(self, token) -> bool:
        for key in self.redis.keys('Server:id:*'):
            print("adsfkjdsabfk")
            if self.redis.get(key).decode() == token:
                self.log.debug("Token on Redis")      
                return True
       
        self.log.debug("Token isn`t on Redis")      
        return False        


                
