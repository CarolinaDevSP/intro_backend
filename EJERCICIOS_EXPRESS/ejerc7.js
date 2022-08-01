/*Crea un endpoint para una petición de tipo DELETE donde envíes un ID (un número cualquiera) a través de params. 
Si el param contiene el ID 3, entonces responde con un status 200 y el mensaje “se ha eliminado 
el objeto con ID 3”, de lo contrario, si envían cualquier otro número como ID, responde con 
un status 404 y el mensaje “No se encontró el objeto con el ID especificado”. */

const express = require('express');
const app = express()

express.json({})
app.use(express.json())

app.delete('/api/delete/:id', (req,res) => {
    const {id} = req.params
    if(id == 3){
        res.status(200).json({message:'se ha eliminado el objeto con ID 3'})
    }else{
        res.status(404).json({message:'No se encontró el objeto con el ID especificado'})
    }
});

//se define el puerto y callback de finalizacion
app.listen(3000, function (){
    console.log('servidor corriendo en el puerto 3000')
})