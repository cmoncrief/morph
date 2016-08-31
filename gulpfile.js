const gulp = require('gulp');
const gutil = require('gulp-util');
const mocha = require('gulp-mocha');
const coffee = require('gulp-coffee');

gulp.task('coffee', function() {
  gulp.src('./src/*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest('./lib/'));
});

gulp.task('coffee-test', function() {
  gulp.src('./test/*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest('./test/'));

  // gulp.src('./test/*.coffee')
  //   .pipe(coffee({bare: true}).on('error', gutil.log))
  //   .pipe(gulp.dest('./test/'));
});



gulp.task('test', function() {
  gulp.src('./test/main.js', {read: false})
  // gulp-mocha needs filepaths so you can't have any plugins before it
    .pipe(mocha({reporter: 'nyan'}))
});
