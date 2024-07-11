const express = require('express');
const app = express();
const userModel = require('./models/user');
const user = require('./models/user');

app.use(express.json());
app.use(express.urlencoded({extended : true}));

app.get('/', (req,res) => {
    res.send("Hey")
});

app.post('/create',async (req,res) => {

    let {name,email,imageUrl} = req.body;
    let user =  await userModel.create({
        name,
        email,
        imageUrl
     });

     console.log("user = "+user);

  
});

app.get('/read',async (req,res) => {

  let users =  await userModel.find();
  console.log(`user=`+user);

  res.statusCode(200).send({
    'code' : '200',
    'message' : 'User created successfully',
    'userData': users,
  });


    res.send("Hey")
});

app.get('/update', (req,res) => {
    res.send("Hey")
});

app.get('/delete', (req,res) => {
    res.send("Hey")
});

app.listen(3000)