/*Vuelve a hacer el ejercicio 2 pero enviando num1 y num2 desde el body, a través de una
petición POST que responda con el status 200
 */
const express = require('express');
const app = express()

express.json({})
app.use(express.json())

app.post('/api/suma', (req,res) => {

    const {num1,num2,suma=num1+num2} = req.body
    
    console.log('num1',req.body.num1);
    console.log('num2',req.body.num2);

   res.status(200).json({message:'OPERACION CON EXITO!!',
             data:{ num1, num2, suma },
                  });
           });

//se define el puerto y callback de finalizacion
app.listen(3000, function (){
    console.log('servidor corriendo en el puerto 3000')
})