var express = require('express');
var router = express.Router();

/* GET home page. */
var request_counter = 0;

router.get('/', function(req, res, next) {
  //res.render('index', { title: 'Express' });
  if (request_counter++ >= 5)
    throw 'Too many requests';

  res.json({
    value_1: "foo",
    value_2: "bar"
  });
});

module.exports = router;
