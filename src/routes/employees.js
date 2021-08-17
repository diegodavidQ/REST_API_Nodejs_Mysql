const express = require('express');
const router = express.Router();

const mysqlConnection = require('../database');

router.get('/', (req, res) => {
    mysqlConnection.query('SELECT * FROM employees', (err, rows, fields) => {
        if(!err){
            res.json(rows);
        } else{
            console.log(err);
        }
    });
});

router.get('/:id', (req, res) => {
    const {id} = req.params;
    
    mysqlConnection.query('SELECT * FROM employees WHERE id = ?', [id], (err, rows, fields) => {
        if(!err){
            res.json(rows[0]);
        } else{
            console.log(err);
        }
    });
});

router.post('/', (req, res) => {
    const { id, name, salary } = req.body;
    const query = `
        SET @id = ?;
        SET @name = ?;
        SET @salary = ?;
        CALL employeeAddOrEdit(@id, @name, @salary);
    `;
    mysqlConnection.query(query, [id, name, salary], (err, rows, fields) => {
        if(!err){
            res.json({Status: 'Employeed Saved'});
        }else {
            console.log(err); 
        }
    });
});

module.exports = router;