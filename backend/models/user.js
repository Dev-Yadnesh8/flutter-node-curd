const mongoose = require('mongoose')
mongoose.connect("mongodb://127.0.0.1:12710/basic_curd_operations");

const userSchema = mongoose.Schema(
    {
        'name' : String,
        'email' : String,
        'profileUrl' : String,
    });
module.exports = mongoose.model('user',userSchema);    