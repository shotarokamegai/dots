var gulp         = require("gulp");
var babel        = require("gulp-babel");
var concat       = require("gulp-concat");
var plumber      = require("gulp-plumber");
var sass         = require("gulp-sass");
var autoprefixer = require('gulp-autoprefixer');
var riot         = require('gulp-riot');
var browserify   = require('browserify');
var babelify     = require('babelify')
var source       = require('vinyl-source-stream');
var server       = require("gulp-webserver");

// watch
gulp.task("watch", () => {
  gulp.watch("src/*.js", ["browserify"]);
  gulp.watch("sass/*.scss", ["sass"]);
});

//sass
gulp.task("sass", () => {
  gulp.src("sass/*.scss")
    .pipe(plumber())
    .pipe(sass({
      outputStyle: 'compressed'
    }))
    .pipe(autoprefixer())
    .pipe(gulp.dest("./css"));
});

gulp.task("riot", () => {
  gulp.src("tags/*.tag")
    .pipe(plumber())
    .pipe(riot())
    .pipe(gulp.dest("./js/compo"));
});

// babelfy (es6)
gulp.task("browserify", () => {
  browserify({
    entries: "./src/main.js",
    debug: false
  })
  .transform(babelify)
  .bundle()
  .on('error', function (err) {
    console.log(err.toString());
  })
  .pipe(source("main.js"))
  .pipe(gulp.dest("js/"));
});

gulp.task("server", (e) => {
  gulp.src("./")
    .pipe(server({
      host: "127.0.0.1",
      directoryListing: true,
      open: true,
      livereload: true
    }));
});

// default
gulp.task("default", ["watch", "server"])
