import http.server
import socketserver

PORT = 8000

class Handler(http.server.SimpleHTTPRequestHandler):
    pass

if __name__ == '__main__':
    with socketserver.TCPServer(("", PORT), Handler) as httpd:
        print(f"Сервер запущен на порту {PORT}")
        httpd.serve_forever()
