/**Agrega un endpoint '/api/swapi' que responda a una petición de tipo GET con el
 *  personaje solicitado de https://swapi.dev/. El cliente debe mandar el número de 
 * personaje mediante params. La respuesta del servidor debe lucir algo así
            { 'personaje': {
            	'name': 'Luke Skywalker',
                        ...,
} }
 */

const express = require('express');
const request = require('request');
const app = express()

express.json({})
app.use(express.json())

app.get('/api/swapi/:numpersonaje',(req,res)=>{
    const numper=req.params.numpersonaje
    console.log(numper)
    request(`https://swapi.dev/api/people/${numper}`,(err,response,body) =>{
        const personajes=JSON.parse(body)
        res.send({'Personaje':{...personajes}})

        console.log('body',body)
    })

    })

//se define el puerto y callback de finalizacion
app.listen(3000, function (){
    console.log('servidor corriendo en el puerto 3000')
})