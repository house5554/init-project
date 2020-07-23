---
to: app.js
---
var createError = require('http-errors');
var <%= name.toLowerCase() %> = require('<%= name.toLowerCase() %>');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./server/routes/index');
var usersRouter = require('./server/routes/users');

var app = <%= name.toLowerCase() %>();
require('./server/config')(app);
// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(<%= name.toLowerCase() %>.json());
app.use(<%= name.toLowerCase() %>.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(<%= name.toLowerCase() %>.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/api', require('./server/routes/api'));

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
