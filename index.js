const express = require("express");
const app = express();

app.get("/", (req, res) => res.json({message:"kagocha"}));

app.listen(9000, () => console.log("app listening on port 9000"));