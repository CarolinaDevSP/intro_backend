/*Agrega un endpoint '/api/usuario/' que responda a una petición de tipo GET con el nombre que sea recibido 
a través de params. El servidor debe responder con un código de estado 200 y un json como este:
            { 'usuario': 'Edwin' }
 */

const express = require('express');
const app = express()

express.json({})
app.use(express.json())

app.get('/api/usuario/:name', (req,res) => {    
    res.status(200).json({        
        usuario:req.params.name})

})

app.listen(3000, function (){
    console.log('servidor corriendo en el puerto 3000')
})