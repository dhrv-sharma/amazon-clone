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
});


// to get all  the product 
adminRoute.get("/admin/get-product",async (req,res)=>{
    try {
        const products= await product.find({}); //list of documnet to find particular item pass id inside ""
        res.json(products);
        
    } catch (error) {
        res.status(500).json({error:error.message});
    }

});

// to delete the product through aadmin panel
 adminRoute.post("/admin/delete-product",async (req,res)=>{
    try {
        const {id}=req.body;
        const products= await product.findByIdAndDelete(id); // particular will get deleted 
        res.json(products);
        

        
    } catch (error) {
        res.status(500).json({error:error.message});

        
    }
 });

// connect to index file
module.exports = adminRoute;
