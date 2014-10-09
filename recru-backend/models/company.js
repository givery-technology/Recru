var mongoose = require('mongoose'),
  schema,
  Company;

schema = mongoose.Schema({
  name: { type: String, required: true },
  averageDifficulty: Number
});

Company = mongoose.model('Company', schema);

module.exports = Company;