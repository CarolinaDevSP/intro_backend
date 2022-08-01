/**
 * Agrega un endpoint '/api/' que responda a una petición de tipo GET con un código de estado 200 y el siguiente json: 
            { 'mensaje':'hola mundo' }
 */
            const http = require('http')

            const server = http.createServer((req, res) => {
            
                const { url: urlReq } = req 
                const baseURL = req.protocol + '://' + req.headers.host + "/"; //base url
                const urlPath = new URL (urlReq, baseURL); //url de la peticion
            
                //evaluamos que el pathname se raiz y el metodo sea get
                if (urlPath.pathname === '/api/'&& req.method === 'GET') {
                console.log('url parse', urlPath.pathname); //url de la peticion
                 
                    res.statusCode = 200;
                    res.setHeader('Content-Type','application/json');
                    res.end(JSON.stringify(
                        { mensaje:'hola mundo' })
            );            
            }
            })
            
            server.listen(3000, 'localhost',() => {
                console.log('servidor ARRIBAAA !!');
            })
