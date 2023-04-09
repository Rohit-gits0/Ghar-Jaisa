//Package Imports
const express = require("express");
const mongoose = require("mongoose");
const DB="mongodb+srv://imperialrogers:imperialrogers@cluster0.jg1vacl.mongodb.net/?retryWrites=true&w=majority";

//Other Files Imports
const authRouter= require('./routes/auth.js');
const adminRouter = require('./routes/admin.js');

//INIT
const PORT = 3000;
const app = express();

//Middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

//connections
mongoose.connect(DB).then(()=>{
    console.log("Connection Successful With MongoDB Database");
}).catch(e => {
    console.log(e);
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected to the port ${PORT}`);
});