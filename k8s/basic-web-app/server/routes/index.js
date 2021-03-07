var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  //res.render('index', { title: 'Express' });

  res.json({
    value_1: "foo",
    value_2: "bar"
  });
});

module.exports = router;
