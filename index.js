require("dotenv").config();
const express = require("express");
const mysql = require("mysql");
const app = express();
const pool = mysql.createPool({
    host:process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME
});

// app.get("/", (req, res) => res.json({message:"kagocha"}));
app.get("/api/library", (req,res)=>{
    pool.query("SELECT * FROM book" ,(error , rows)=>{
        if (error){
            return res.status(500).json({error});
        }
        res.json(rows);
    });
});
app.get("/api/library/:id", (req, res) =>{
    pool.query(
        "SELECT library_id, name FROM library WHERE library_id = ?",
        [req.params.id],
        (error,rows) => {
            if (error) {
                return res.status(500).json({error });
            }
            res.json(rows);
        }
    );
});
app.get("/api/library/book/:book_id", (req, res)=>{
    pool.query(
        "SELECT b.book_title, b.book_id, b.book_genre, b.image, name FROM book as b JOIN library ON library_id=b.book_id WHERE book_id = ?"
    
        [req.params.book_id],
        (error, rows) =>{
            if (error) {
                return res.status(500).json({error});
            }
            res.json(rows);
        }
    );
});
app.listen(9000, () => console.log("app listening on port 9000"));