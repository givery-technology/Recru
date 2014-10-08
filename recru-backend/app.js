var express = require('express'),
    nconf = require('nconf'),
    app = express(),
    mongoose = require('mongoose'),
    routes,
    server;

nconf.file({ file: 'config/settings.json' });

// mongoose.connect(nconf.get('database:host'));

function error(err, req, res, next) {
  res.status(err.status || 500);
  res.send({ error: err.message });
}

app.use(function(req, res, next) {
	console.log('%s %s %s', Date.now(), req.method, req.url);
	next();
});

app.use(error);

routes = require('./routes')(app);

server = app.listen(nconf.get('port'), function() {
  console.log('RECRU Server listening on port %d', server.address().port);
});