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

    let {name,email,profileUrl} = req.body;
    let user =  await userModel.create({
        name,
        email,
        profileUrl
     });

     console.log("user = "+user);
     res.send({
        
     })

  
});

app.get('/read',async (req,res) => {

  let users =  await userModel.find();
  console.log(`user=`+users);
if(res.statusCode == 200){
    res.send({
    'code' : '200',
    'message' : 'User created successfully',
    'userData': users,
    })
}
});

app.get('/update', (req,res) => {
    res.send("Hey")
});

app.delete('/delete/:userId',async (req,res) => {
 let deletedUser = await userModel.findOneAndDelete({_id:req.params.userId})
 console.log("Deleted User--"+deletedUser);
 res.status(200).send(deletedUser);
});

app.listen(3000)