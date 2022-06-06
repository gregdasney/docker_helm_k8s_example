//Shamelessly stolen from somewhere on the internet (I don't remember where because I had this code snippet in my clipboard history)
//lines 14-16 are original
'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
//middleware that intercepts all requests and returns the string "Hello World"
app.use(function(req,res){
    res.send('Hello World');
})
app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);