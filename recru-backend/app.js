var express = require('express'),
    config = require('nconf'),
    app = express(),
    mongoose = require('mongoose'),
    middleware = require('./middleware'),
    routes = require('./routes'),
    server;

config.file({ file: 'config/settings.json' });

mongoose.connect(config.get('database:development:uri'));

middleware(app);
routes(app);

server = app.listen(config.get('port'), function() {
  console.log('RECRU Server listening on port %d', server.address().port);
});