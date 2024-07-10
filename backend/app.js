const express = require('express');
const app = express();
const userModel = require('./models/user');

app.use(express.json());
app.use(express.urlencoded({extended : true}));

app.get('/', (req,res) => {
    res.send("Hey")
});

app.get('/create', (req,res) => {
  
});

app.get('/read', (req,res) => {
    res.send("Hey")
});

app.get('/update', (req,res) => {
    res.send("Hey")
});

app.get('/delete', (req,res) => {
    res.send("Hey")
});

app.listen(3000)