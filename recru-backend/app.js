var express = require('express'),
    nconf = require('nconf'),
    app = express(),
    mongoose = require('mongoose'),
    bodyParser = require('body-parser'),
    multer = require('multer'),
    routes,
    server;

nconf.file({ file: 'config/settings.json' });

mongoose.connect('mongodb://localhost:27017');

function error(err, req, res, next) {
  res.status(err.status || 500);
  res.send({ error: err.message });
}

app.use(function(req, res, next) {
	console.log('%s %s %s', Date.now(), req.method, req.url);
	next();
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(multer());
app.use(error);

routes = require('./routes')(app);

server = app.listen(nconf.get('port'), function() {
  console.log('RECRU Server listening on port %d', server.address().port);
});