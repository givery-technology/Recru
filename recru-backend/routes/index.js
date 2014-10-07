module.exports = function (app) {
  app.route('/')
    .get(function(req, res, next) {
      // res.send('GET Recru!');
      res.json({
        "message": "test"
      });
    })
    .post(function(req, res, next) {
      // res.send(req.params);
      res.send('Request recieved!');
      // res.send('POST Recru!');
    });

  app.route('/api')
    .get(function(req, res, next) {
      // res.send('GET Recru!');
      res.json({
        "message": "test"
      });
    })
    .post(function(req, res, next) {
      res.send('POST Recru!');
    });
};