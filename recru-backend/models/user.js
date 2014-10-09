var mongoose = require('mongoose'),
  schema,
  User;

schema = mongoose.Schema({
  name: { first: String, last: String }
});

User = mongoose.model('User', schema);

module.exports = User;