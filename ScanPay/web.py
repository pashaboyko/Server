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



async def login(request):
    post_data = await request.post()
    print(post_data)

    try:
        print(MySqlCon.get_instance().search_user(post_data['email'],post_data['password']))
        user = MySqlCon.get_instance().search_user(post_data['email'],post_data['password'])
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'},status = 400)
    payload = {
        'user_id': user["bordercode"],
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
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'},status = 400)
    #data_json = json.dumps(admin)
    #print(data_json)
    #return json_response(admin)
    return json_response({'status': '200', 'message': 'Enter successful'})


async def get_user(request):
    post_data = await request.post()
    try:
        print(post_data['barcode'])
        print("sdnckdncjkdsncjn")
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
    
async def subcategory(request):
    post_data = await request.post()
    try:
        item = MySqlCon.get_instance().relative_subcategory(post_data['category'])
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'}, status=400)
    data_json = json.dumps(item)
    print(data_json)
    return json_response(item)

async def manufacturer(request):
    post_data = await request.post()
    try:
        item = MySqlCon.get_instance().manufacturer_list(post_data['category'])
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'}, status=400)
    return json_response(item)

async def checkbarcode(request):
    post_data = await request.post()
    try:
        MySqlCon.get_instance().checkbarcode(post_data['barcode'])
    except Exception:
        print("njenvjkberjbv")
        return json_response({'status': '400', 'message': 'Wrong credentials'}, status=400)
    return json_response({'status' : 'ok', 'message': 'Barcode is new'}, status=200)

'''async def checkbarcode_true(request):
    post_data = await request.post()
    try:
        MySqlCon.get_instance().checkbarcode_true(post_data['barcode'])
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'}, status=400)
    return json_response({'status' : 'ok', 'message': 'Barcode is new'}, status=200)'''

async def add(request):
    post_data = await request.post()
    try:
        MySqlCon.get_instance().add_row_to_products(post_data['name'],post_data['barcode'],post_data['price'],post_data['id_subcategory'],post_data['id_manufacturer'], post_data['delivery_date'], post_data['quantity'])
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'}, status=400)
    return json_response({'status' : 'ok', 'message': 'Added'}, status=200)

async def edit(request):
    post_data = await request.post()
    try:
        MySqlCon.get_instance().edit_products(post_data['id_product'],post_data['name'],post_data['price'],post_data['id_category'],post_data['id_subcategory'],post_data['id_manufacturer'], post_data['photo'], post_data['points'],post_data['delivery_date'], post_data['quantity'])
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'}, status=400)
    return json_response({'status' : 'ok', 'message': 'Added'}, status=200)

async def add_features(request):
    post_data = await request.post()
    try:
        MySqlCon.get_instance().add_features_value( post_data['value'], post_data['id_feature'],post_data['barcode'])
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'}, status=400)
    return json_response({'status' : 'ok', 'message': 'Added'}, status=200)

async def edit_features(request):
    post_data = await request.post()
    try:
        MySqlCon.get_instance().edit_features_value( post_data['id_feature_value'],post_data['value'], post_data['id_feature'],post_data['id_product'])
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'}, status=400)
    return json_response({'status' : 'ok', 'message': 'Added'}, status=200)
    
async def delete(request):
    post_data = await request.post()
    print(post_data['barcode'])
    try:
        MySqlCon.get_instance().delete(post_data['barcode'])
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'}, status=400)
    return json_response({'status' : 'ok', 'message': 'Deleted'}, status=200)


async def get_rowcount(request):
    try:
        row = MySqlCon.get_instance().rowcount()
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'}, status=400)
    return json_response(row)

async def listProductlimit(request):
    post_data = await request.post()
    print(post_data['startLimit'],post_data['limit'])
    print("233232212112")
    try:
        item = MySqlCon.get_instance().listProduct(post_data['startLimit'],post_data['limit'])
        print(item)
    except Exception:
        return json_response({'status': '400', 'message': 'Wrong credentials'}, status=400)
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
                print (payload)
            except (jwt.DecodeError, jwt.ExpiredSignatureError):
                return json_response({'status' : 'error', 'message': 'Token is invalid'},
                                     status=400)
            print (23432432)

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
app.router.add_route('POST', '/listProductlimit', listProductlimit)
app.router.add_route('POST', '/category', subcategory)
app.router.add_route('POST', '/manufacturer', manufacturer)
app.router.add_route('POST', '/add', add)
app.router.add_route('POST', '/add_features', add_features)
app.router.add_route('POST', '/checkbarcode', checkbarcode)
app.router.add_route('GET', '/rowcount', get_rowcount)
app.router.add_route('POST', '/edit', edit)
app.router.add_route('POST', '/delete', delete)
app.router.add_route('POST', '/edit_features', edit_features)
#app.router.add_route('POST', '/checkbarcode_true', checkbarcode_true)
web.run_app(app, port=3000)



