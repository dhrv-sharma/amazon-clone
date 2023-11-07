// no listening required as already done in index
const express = require("express");
const User=require("../model/user");
const bycryptjs=require('bcryptjs')

const authRouter=express.Router();


authRouter.post('/api/signup',async(req,res)=>{
    // get the data from the client 
    // post the data in the database 
    // return data to the user 

    try{
        
    // get data from req.body
    req.body;// data will be in map
    const {name ,email,password}=req.body;

    const exhistUser=await User.findOne({email});
    if (exhistUser) {
        return res.status(400).json({msg:"User already exhist"});// status code 200 :OK
        
    }

    // creating an instance for user 
// for passwrod encryption
    const hashpass=await bycryptjs.hash(password,8); // hashing 8 is salt 
    let user =new User({
        email,
        password:hashpass,
        name
    })

    // saving a new account 
    // id unique ide
    // _v number of files edited
    user = await user.save();
    // it will post data
    res.json(user);
    }catch(e){
        res.status(500).json({error: e.message});

    }


    // post data in database need to connect with db
})

// to access variable outside the file 
module.exports = authRouter;
