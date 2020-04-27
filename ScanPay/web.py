import os
import logg
import json
from datetime import datetime, timedelta
from mysqlCon import MySqlCon

from aiohttp import web
import jwt


JWT_SECRET = 'secret'
JWT_ALGORITHM = 'HS256'
JWT_EXP_DELTA_SECONDS = 20


def json_response(body='', **kwargs):
    print(body)
    kwargs['body'] = json.dumps(body or kwargs['body'], ensure_ascii=False)
    kwargs['content_type'] = 'application/json'
    print(kwargs)
    return web.Response(**kwargs)

def jsons_response(jsons, **kwargs):
    kwargs['body'] = jsons
    kwargs['content_type'] = 'application/json'
    print(kwargs)
    return web.Response(**kwargs)


async def login(request):
    post_data = await request.post()
    print(post_data)

    try:
        print(MySqlCon.get_instance().search_user(post_data['email'],post_data['password']))
        user = MySqlCon.get_instance().search_user(post_data['email'],post_data['password'])
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'},status = 400)
    payload = {
        'user_id': user["barcode_user"],
        'exp': datetime.utcnow() + timedelta(seconds=JWT_EXP_DELTA_SECONDS)
    }

    jwt_token = jwt.encode(payload, JWT_SECRET, JWT_ALGORITHM)
    print(jwt_token)
    return json_response({'status': 'ok', 'message': jwt_token.decode('utf-8')})
    
async def entering(request):
    post_data = await request.post()
    print(post_data)

    try:
        print(MySqlCon.get_instance().search_admin(post_data['barcode'],post_data['password']))
        admin = MySqlCon.get_instance().search_admin(post_data['barcode'],post_data['password']) 
        response = {'status': '200', 'message': 'Enter successful'}
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'},status = 400)
    #data_json = json.dumps(admin)
    #print(data_json)
    #return json_response(admin)
    return json_response(response)


async def get_user(request):
    post_data = await request.post()
    try:
        item = MySqlCon.get_instance().search_barcode(post_data['barcode'])
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'}, status=400)
    data_json = json.dumps(item)
    print(data_json)
    return json_response(item)
    
async def get_user_moreinfo(request):
    post_data = await request.post()
    try:
        item = MySqlCon.get_instance().search_barcode_moreinfo(post_data['barcode'])
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'}, status=400)
    data_json = json.dumps(item)
    print(data_json)
    return json_response(item)

async def get_info(request):
    post_data = await request.post()
    try:
        item = MySqlCon.get_instance().product_info(post_data['barcode'])
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'}, status=400)
    data_json = json.dumps(item)
    print(data_json)
    return json_response(item)


async def auth_middleware(app, handler):
    async def middleware(request):
        request.user = None

        jwt_token = request.headers.get('authorization', None)
        print(jwt_token)
        print("jwt_token")
        if jwt_token:
            try:
                payload = jwt.decode(jwt_token, JWT_SECRET,
                                     algorithms=[JWT_ALGORITHM])
            except (jwt.DecodeError, jwt.ExpiredSignatureError):
                return json_response({'status' : 'error', 'message': 'Token is invalid'},
                                     status=400)

            request.user = User.objects.get(id=payload['user_id'])
        return await handler(request)

    return middleware
'''
if __name__ == "__main__":

    log_directory = 'log'
    if not os.path.exists(log_directory):
        os.makedirs(log_directory)

    try:
        con = MySqlCon.get_instance()

    except Exception:
        log.exception('Error connect to Mysql')
        pass
'''
log=logg.setup_logging('Server')
app = web.Application(middlewares=[auth_middleware])
app.router.add_route('POST', '/barcode', get_user)
app.router.add_route('POST', '/barcodeall',get_user_moreinfo)
app.router.add_route('POST', '/login', login)
app.router.add_route('POST', '/info', get_info)
#app.router.add_route('GET', '/barcodeall', get_user_moreinfo)
app.router.add_route('POST', '/entering', entering)
web.run_app(app, port=3000)



