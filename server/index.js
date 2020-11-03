const express = require('express')
const app = express()
const port = 3000
const dotenv = require('dotenv')
dotenv.config()
const mongoose = require('mongoose'); 
mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true }, () => {
    console.log('connect db!')
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