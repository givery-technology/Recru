var Review = require('../models/review');

module.exports = function (app) {
  app.route('/review')
    .get(function(req, res, next) {
      res.json({
        "message": "test"
      });
    })

    .post(function(req, res, next) {
      console.log(req.body);
      
      var review = new Review({
        // author: req.session.user,
        company: req.body.company,
        location: req.body.location,
        jobPosition: req.body.jobPosition,
        jobField: req.body.jobField,
        additionalInformation: req.body.additionalInformation,
        interviewProcess: req.body.additionalInformation,
        difficulty: req.body.difficulty,
        overallExperience: req.body.overallExperience,
        interviewOutcome: req.body.interviewOutcome,
        recommendEmployer: req.body.recommendEmployer
      });

      review.save(function(err) {
        if (err) {
          console.log('Error saving!');
          console.log(err);
        } else {
          console.log('Save OK!');
        }
      });

      res.send({ "result" : "success" });
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