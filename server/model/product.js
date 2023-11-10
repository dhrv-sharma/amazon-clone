const mongoose=require("mongoose");

const productSchema=mongoose.Schema({
    name:{
        type:String,
        required:true,
        trim:true,
    },
    description:{
        type:String,
        required:true,
        trim:true,
    },
    images : [{// arrray of images having these property
        type:String,
        required:true,
    }],
    quantity:{
        type:Number,
        required:true
    },
    price:{
        type:Number,
        required:true
    },
    category:{
        type:String,
        required:true
    },
    // ratings


});




// creating model on the data base 
const product = mongoose.model('Product_info',productSchema); // name on mongo db is product_info
module.exports=product;