let mongoose = require('mongoose');
let mycollectionSchema = new mongoose.Schema({msg:String});
module.exports = mongoose.model('User',mycollectionSchema);