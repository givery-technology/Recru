module.exports = function (app) {
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

  app.route('/reviews')
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