//  contains all the functions of the admin

const express= require('express');
const adminRoute = express.Router();
const product = require('../model/product');

// creating api for adding route
// post 
adminRoute.post('/admin/add-product',async (req,res)=>{
    try {
        // taking input from the admin
        const {name,description,images,quantity,price,category}=req.body;
        //  let allow us to change 
        let Product=product({
            name,description,images,quantity,price,category
        });
        Product = await Product.save();  // Product get saved
        res.json(Product);
        
    } catch (error) {
        res.status(500).json({error:error.message});
        
    }
})

// connect to index file
module.exports = adminRoute;
