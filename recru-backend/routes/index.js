module.exports = function (app) {
  app.route('/')
    .get(function(req, res) {
      res.send('GET Recru!');
    })
    .post(function(req, res) {
      res.send('POST Recru!');
    });
};