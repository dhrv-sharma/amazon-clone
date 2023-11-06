// instead for every change no need to restart the server once again use nodemon as de
// pacakges are installed by npm 
// index file is the first it will execute  mention in main of package.js
// print hello world
// promises dont wait for the async functions and run other parts of the code 
// using mongose db
console.log("Hello World");

// importing  express package like importing material dart in flutter
const express_import=require('express');
const PORT=3000; // any number can be mention
const mongo=require('mongoose');

// intializing 
const app = express_import();
// const dv="mongodb+srv://dhruvsharma10082004:<password>@cluster0.1aeo6yi.mongodb.net/?retryWrites=true&w=majority";
const db="mongodb+srv://dhruvsharma10082004:Dhruvsharma@cluster0.lcfa0kn.mongodb.net/?retryWrites=true&w=majority";


// importing from another json file
const authRouter= require('./routes/auth.js');
const { default: mongoose } = require('mongoose');

//middleaware to use another json file 
// socekt io for continous listening
// CLIENT(flutter app) ->middleware ->SERVER -> CLIENT(flutter app)
app.use(express_import.json());
app.use(authRouter);


// local host 
// listen function 
// android dont take local host hence we can use 0.0.0.0 here we can also paste url for hosting
// binds host with connection 
app.listen(PORT,"0.0.0.0",() => {
    // call back function
    console.log('connected at port hello '+PORT);
})

// connect to mongo database
mongoose.connect(db).then(()=>{
    console.log("connection succesffuly");
}).catch((e)=>{
    console.log(e);
})


// creating an api 
// API HAVE CRUD OPERATION
// API HAVE GET  PUT POST DELETE UPDATE operation 
// get operation over localhost:3000/helloworld
app.get('/helloworld',(req,res)=>{
    // req stands for request
    // res stands for results 
    // res.send("hello world"); it gives normal text 
    res.json(
        {
            hi : "hello world ",
            desc :"yeah"
        }
    );
})

// get operation over localhost:3000/apple
app.get("/apple",(req,res)=>{
    res.json(
        {
            name:"apple",
            desc:"this is amazon clone working right now"
        }
    )
})


// get operation over localhost:3000
app.get("/",(req,res)=>{
    res.json(
        {
            name:"Dhruv Sharma",
            desc:"Flutter developer"
        }
    )
})







