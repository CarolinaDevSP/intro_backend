/*
Agrega un endpoint '/api/body que responda a una petición de tipo PUT con el body que el 
cliente envíe al hacer la petición. Ejemplo: cliente envía un body desde postman o insomnia que luce como este:
{ “nombre”: “Maui”, “ocupacion”: “Sensei” }
Entonces, el servidor debe responder con un objeto idéntico al que envía el cliente, 
junto con un status de respuesta 200.
 */

const express = require('express');
const app = express()

express.json({})
app.use(express.json())

app.put('/api/body', (req,res) => {
    const {nombre,ocupacion} = req.body
    res.status(200).json({
        message:'USUARIO ACTUALIZADO OK',
        data: {
            nombre,
            ocupacion
        }
    })

})

//se define el puerto y callback de finalizacion
app.listen(3001, function (){
    console.log('servidor corriendo en el puerto 3000')
})