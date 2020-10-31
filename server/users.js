let mongoose = require('mongoose');
let mycollectionSchema = new mongoose.Schema({name : String, fav: String});
module.exports = mongoose.model('User',mycollectionSchema);