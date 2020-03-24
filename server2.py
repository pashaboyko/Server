import socketserver

# Обработчик соедиений
class ThreadedTCPRequestHandler(socketserver.BaseRequestHandler):    

    # Обработка запроса
    def handle(self):
        print('Входящее соединение...', self.client_address)

        # self.request — сокет входящего соединения
        data = str(self.request.recv(1024), 'utf-8')

        # Удаляем пробелы по краям строки
        data = data.strip()

        print ('Получена строка:', data)

        # Формируем ответ
        response = 'Сервер успешно получил "{}"'.format(data)
        self.request.sendall(bytes(response, 'utf-8'))

# Делаем обработчик многопоточным
class ThreadedTCPServer(socketserver.ThreadingMixIn, socketserver.TCPServer):
    pass

if __name__ == "__main__":
    HOST, PORT = '', 5004
    
    # Создаём сервер и указываем, какой класс обрабатывает
    server = ThreadedTCPServer((HOST, PORT), ThreadedTCPRequestHandler)

    try:
        # Обслуживать непрерывно
        server.serve_forever()
    # Если нажали Ctrl-C
    except KeyboardInterrupt:
        print ('Shutdown server')
        server.shutdown()
        server.server_close()
