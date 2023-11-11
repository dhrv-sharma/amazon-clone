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

module.exports = productRouter; // used to bind the file index
