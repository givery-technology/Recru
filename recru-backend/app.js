var express = require('express'),
    nconf = require('nconf'),
    app = express(),
    mongoose = require('mongoose'),
    middleware = require('./middleware'),
    routes = require('./routes'),
    server;

nconf.file({ file: 'config/settings.json' });

mongoose.connect('mongodb://localhost:27017');

middleware(app);
routes(app);

server = app.listen(nconf.get('port'), function() {
  console.log('RECRU Server listening on port %d', server.address().port);
});