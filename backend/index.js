const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
	let r = (Math.random() + 1).toString(36).substring(7);
	let finalString = 'Hello' + r;
	res.send({ success: true, data: finalString });
});

app.listen(port, () => {
	console.log(`Example app listening on port ${port}`);
});
