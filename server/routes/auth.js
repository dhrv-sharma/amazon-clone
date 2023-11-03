// no listening required as already done in index
const express = require("express");
const User=require("../model/user");

const authRouter=express.Router();


authRouter.post('/api/signup',async(req,res)=>{
    // get the data from the client 
    // post the data in the database 
    // return data to the user 

    // get data from req.body
    req.body;// data will be in map
    const {name ,email,password}=req.body;

    const exhistUser=await User.findOne({email});
    if (exhistUser) {
        return res.status(400).json({msg:"User already exhist"});// status code 200 :OK
        
    }

    let user =new User({
        email,
        password,
        name
    })

    user = await user.save();

    // post data in database need to connect with db
})

// to access variable outside the file 
module.exports = authRouter;
