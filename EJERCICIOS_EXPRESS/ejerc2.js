/**
 * Agrega un endpoint '/api/suma' que responda a una petición de tipo GET con la suma de dos números que reciba
 *  mediante las querys num1 y num2. El servidor debe responder con un código de estado 200 y un json como el siguiente:
            { 'resultado': 7 }
*/
const http = require('http')

const server = http.createServer((req, res) => {
        const num1 = 20;
        const num2 = 10;
        const sum = num1 + num2;
        console.log(sum);
   
    const { url: urlReq } = req 
    const baseURL = req.protocol + '://' + req.headers.host + "/"; //base url
    const urlPath = new URL (urlReq, baseURL); //url de la peticion

    //evaluamos que el pathname se raiz y el metodo sea get
    if (urlPath.pathname === '/api/suma'&& req.method === 'GET') {
    console.log('url parse', urlPath.pathname); //url de la peticion
     
    res.statusCode = 200;
    res.setHeader('Content-Type','application/json');
    res.end(JSON.stringify({ RESULTADO :sum}))  
    }    
})

server.listen(3000, 'localhost',() => {
    console.log('servidor ARRIBAAA !!');
})