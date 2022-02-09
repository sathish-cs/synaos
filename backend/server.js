'use strict';

const express = require('express');

// Constants
const PORT = 8000;
const HOST = '0.0.0.0';

/* App
const app = express();
app.get('/random', (req, res) => {
  let r = (Math.random() + 1).toString(36).substring(7);
  res.send ('r');
});
*/

const app = express();
app.get('/random', function(req, res){
  let r = (Math.random() + 1).toString(36).substring(7);
  res.send(r);
});


app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);

