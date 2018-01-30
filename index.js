const express = require('express')
const app = express()
const mysql = require('mysql2/promise')

app.use(express.static('public'))
app.set('view engine', 'ejs')


app.get('/', (req, res) => {
    res.render('home')
})

const init = async() => {
    const connection = await mysql.createConnection({
        host: '127.0.0.1',
        user: 'root',
        password: 'barbara1997',
        database: 'futibaclub'

    })
    const [rows, fields] = await connection.execute('select * from usuario')
    console.log(rows)

}
init()


app.listen(3000, err => {
    console.log('Servidor rodando....')
})