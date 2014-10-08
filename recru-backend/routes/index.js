var Review = require('../models/review');

module.exports = function (app) {
  app.route('/')
    .get(function(req, res, next) {
      // res.send('GET Recru!');
      res.json({
        "message": "test"
      });
    })
    .post(function(req, res, next) {
      console.log(req.body);
      var review = new Review({
        jobPosition: req.body.jobPosition,
        additionalInformation: req.body.additionalInformation
      });

      review.save(function(err) {
        if (err) {
          console.log('Error saving!');
          console.log(err);
        } else {
          console.log('Save OK!');
        }
      });

      res.send('Request received!');

      // var body = '';

      // req.on('data', function (data) {
      //   body += data;
      // });

      // req.on('end', function() {
      //   console.log('done');
      //   console.log(body);

      //   var review = new Review({
      //     name: 'Test',
      //     jobPosition: body["jobPosition"],
      //     additionalInformation: body["additionalInformation"]
      //   });

      //   review.save(function(err) {
      //     if (err) {
      //       console.log('Error saving!');
      //       console.log(err);
      //     } else {
      //       console.log('Save OK!');
      //     }
      //   });
      //   res.send('Request recieved!');
      //   // res.send('POST Recru!');
      // });
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