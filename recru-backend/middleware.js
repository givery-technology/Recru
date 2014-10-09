var bodyParser = require('body-parser'),
    multer = require('multer');

module.exports = function(app) {
  function error(err, req, res, next) {
    res.status(err.status || 500);
    res.send({ error: err.message });
  }

  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({ extended: true }));
  app.use(multer());
  app.use(error);
  app.use(function(req, res, next) {
    console.log('%s %s %s', Date.now(), req.method, req.url);
    next();
  });
};