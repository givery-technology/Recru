var mongoose = require('mongoose'),
  schema,
  Review;

schema = mongoose.Schema({
    author: { type: String, ref: 'User' },
    company: { type: String, ref: 'Company', required: true },
    location: String,
    jobPosition: String,
    jobField: String,
    additionalInformation: String,
    interviewProcess: String,
    difficulty: { type: Number, min: 1, max: 10 },
    overallExperience: String,
    interviewOutcome: String,
    recommendEmployer: Boolean  
});

Review = mongoose.model('Review', schema);

module.exports = Review;