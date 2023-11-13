const express= require('express');
const userRouter = express.Router();
const User=require("../model/user");
const {product} = require('../model/product');



userRouter.post('/user/add-to-cart',async (req,res)=>{
    try {
        const {id,user_id}=req.body;
        let products =await product.findById(id);
        // cart is in user model hence we can store in the provider instead of requesting it again
        let user=await User.findById(user_id);
//   mongodb have rray of object and object have propert of product: and then it have _id
        // // checking the user cart 
        if (user.cart.length == 0) { 
            // length is zero hence we can say that no product is added
            user.cart.push({product:products,quantity:1});

        }else{
            // product is already added
            let productFound = false;
            for (let i = 0; i < user.cart.length; i++) {
                if (user.cart[i].product._id.equals(products._id)) {
                    // _id given by moggose id
                    productFound = true;

                    
                }
                
            }
            // product found hence quantity need to be increased
            if (productFound) {
                let producttt = user.cart.find((productt) =>
                   productt.product._id.equals(products._id)
            );
            producttt.quantity += 1;
                
            }else{
            // product not found hence push operations 
            user.cart.push({product:products,quantity:1});
                
 
            }

        }
        user = await user.save();
        res.json(user);



        
    } catch (error) {
        res.status(500).json({error:error.message});
        
    }
});


userRouter.delete('/user/remove-from-cart',async (req,res)=>{
    try {
        const {id,user_id}=req.body;
        let products =await product.findById(id);
        let user=await User.findById(user_id);

            for (let i = 0; i < user.cart.length; i++) {
                if (user.cart[i].product._id.equals(products._id)) {
                    // _id given by moggose id
                    if (user.cart[i].quantity == 1) {
                    user.cart.splice(i,1);// delete the product
                        
                    }else{
                        user.cart[i].quantity -=1;// delet the product

                    }
                }
            }

        user = await user.save();
        res.json(user);



        
    } catch (error) {
        res.status(500).json({error:error.message});
        
    }
});




module.exports = userRouter;
