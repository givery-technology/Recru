var express = require('express'),
    nconf = require('nconf'),
    app = express(),
    routes = require('./routes')(app);

nconf.file({ file: 'config/settings.json' });

app.listen(nconf.get('port'));