console.log("starting ADC script...")

var express = require('express')
var app = express()

var voltage = '666'

app.get('/', function (req, res) {
    res.send("The voltage is "+voltage);
})

var server = app.listen(80, function () {

    var host = server.address().address
    var port = server.address().port

    console.log('Example app listening at http://%s:%s', host, port)
})
