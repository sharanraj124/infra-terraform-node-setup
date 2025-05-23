const express = require("express");
const app = express();
const port = process.env.PORT || 3000;


app.get("/", (req, res, next) => {
	res.status(200).send("hello world");
})

app.get("/health", (req, res) => {
	res.status(200).send("helath ok")
})

app.listen('0.0.0.0', port, (req, res) => {
	console.log(`listing port http://localhost:${port}`);
})

