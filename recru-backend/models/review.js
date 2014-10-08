var mongoose = require('mongoose'),
  Review = mongoose.model('Review', {
    name: String,
    jobPosition: String,
    additionalInformation: String
  });

module.exports = Review;