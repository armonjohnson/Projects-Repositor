// server.js
const express = require("express");
const path = require("path");
const mysql = require("mysql2/promise");

const app = express();
const PORT = 3000;

// TODO: change to your actual DB name/user/pass
const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "your_mysql_password",
  database: "employee_directory",
});

// Middlewares
app.use(express.json());
app.use(express.static(path.join(__dirname, "public")));

// GET /api/employees
app.get("/api/employees", async (req, res) => {
  try {
    const [rows] = await pool.query(
      "SELECT id, full_name, email, role, department, location, join_date, photo_url FROM employees ORDER BY id DESC"
    );
    res.json(rows);
  } catch (err) {
    console.error("Error fetching employees", err);
    res.status(500).json({ error: "Failed to fetch employees" });
  }
});

// POST /api/employees
app.post("/api/employees", async (req, res) => {
  try {
    const { full_name, email, role, department, location, join_date } = req.body;

    if (!full_name || !email) {
      return res.status(400).json({ error: "full_name and email are required" });
    }

    const [result] = await pool.query(
      `INSERT INTO employees (full_name, email, role, department, location, join_date)
       VALUES (?, ?, ?, ?, ?, ?)`,
      [full_name, email, role || "", department || "", location || "", join_date || null]
    );

    const [rows] = await pool.query(
      "SELECT id, full_name, email, role, department, location, join_date, photo_url FROM employees WHERE id = ?",
      [result.insertId]
    );

    res.status(201).json(rows[0]);
  } catch (err) {
    console.error("Error inserting employee", err);
    res.status(500).json({ error: "Failed to create employee" });
  }
});

// Fallback: send index.html for root
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "public", "index.html"));
});

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
