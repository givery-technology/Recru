var Review = require('../models/review');

module.exports = function (app) {
  app.route('/reviews')
    .get(function(req, res, next) {
      console.log(req.body);
      Review.find({}, '_id company jobPosition', function(err, results) {
        console.log(results);
        res.send({
          "status": "success",
          "data": results
        });
      });
      // Review.findOne({}, function(err, review) {
      //   console.log(review);
      //   res.send({
      //     "status": "success",
      //     "data": review
      //   });
      // });
    })

    .post(function(req, res, next) {
      console.log(req.body);
      
      var review = new Review({
        // author: req.session.user,
        company: req.body.data.company,
        location: req.body.data.location,
        jobPosition: req.body.data.jobPosition,
        jobField: req.body.data.jobField,
        additionalInformation: req.body.data.additionalInformation,
        interviewProcess: req.body.data.additionalInformation,
        difficulty: req.body.data.difficulty,
        overallExperience: req.body.data.overallExperience,
        interviewOutcome: req.body.data.interviewOutcome,
        recommendEmployer: req.body.data.recommendEmployer
      });

      review.save(function(err) {
        if (err) {
          console.log('Error saving!');
          console.log(err);
          res.send({
            "status": "error",
            "data" : err.message
          });
        } else {
          console.log('Save OK!');
          res.send({
            "status": "success",
            "data" : review
          });
        }
      });
    });

  app.route('/reviews/:id')
    .get(function(req, res, next) {
      console.log(req.body);

      Review.findOne({ '_id': req.params.id }, function(err, review) {
        if (err) {
          console.log(err);
          res.send({
            "status": "error",
            "message": err.message
          });
        } else {
          console.log(review);
          res.send({
            "status": "success",
            "data": review
          });
        }
      });
    });

  app.route('/')
    .get(function(req, res, next) {
      // res.send('GET Recru!');
      res.json({
        "message": "this is test"
      });
    })
    .post(function(req, res, next) {
      res.send('POST Recru!');
    });
};