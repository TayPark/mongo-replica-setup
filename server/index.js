const express = require('express')
const app = express()
const port = 3000
const dotenv = require('dotenv')
dotenv.config()
const mongoose = require('mongoose'); 
mongoose.connect('mongodb://lunarcat:lunarcat1234!@mongodb1:27017,mongodb2:27018,mongodb3:27019/lunarcat?replicaSet=rs0', { useNewUrlParser: true, useUnifiedTopology: true }, (err) => {
    if (err) console.log(err)
    else console.log('connect db!')
});
let db = mongoose.connection;

let Mycollection = require('./users.js');
app.get('/', (req, res) => {
    Mycollection.find({})
    .then(doc => {
        console.log(doc)
        res.send(doc)
    })
    .catch(err => {
        console.error(err)
    })
})
app.listen(port, () => {
    console.log('server start!')
})