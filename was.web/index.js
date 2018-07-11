express = require('express');
var app = express();

var config = require('./config');

app.set('view engine', 'ejs')
app.use(express.static('public'))
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

//rutas

app.get('/', function(req, res) { res.render('pages/index') })
app.get('/login', function(req, res) { res.render('pages/login') })
app.get('/registro', function(req, res) { res.render('pages/registro') })


app.listen(4020, function () { console.log('server prueba esta corriendo en el puerto 4020!') })