const express= require('express');
const productRouter = express.Router();
const product = require('../model/product');


// api to get category product
// no post data but query the data 
// /api/cat-product?category=Essentials
// url?property 
productRouter.get("/api/cat-product",async (req,res)=>{
    try {
        console.log(req.query.category);// asking category from client 
        const products= await product.find({category:req.query.category}); //list of documnet to find particular item pass id inside ""
        res.json(products);
        
    } catch (error) {
        res.status(500).json({error:error.message});
    }

});

// api for searched product
// url/:parameter get passed
productRouter.get("/api/search-product/:name",async (req,res)=>{
    try {
        console.log(req.query.category);// asking category from client 
        const products= await product.find({name:{$regex:req.params.name,$options:"i"}});  // regex is used to find common pattern with i as The "i" stands for "ignore case". This means that the regular expression will match characters disregarding their case, so both uppercase and lowercase letters will be considered as equivalent.
        res.json(products);
        
    } catch (error) {
        res.status(500).json({error:error.message});
    }

});


module.exports = productRouter; // used to bind the file index
