require! <[
  express 
  run-sequence 
  js-string-escape
  gulp 
  gulp-if 
  gulp-karma
  gulp-concat 
  gulp-rename
  gulp-purescript 
  gulp-livescript
  gulp-filter
  gulp-uglify
  gulp-file-include
]>

paths =
  test:
    src: <[
      bower_components/rxjs/dist/rx.all.js
      bower_components/purescript-*/src/**/*.purs
      bower_components/purescript-*/src/**/*.purs.hs
      src/**/*.purs
    ]>
    dest: "tmp"

options =
  test:
    output: "Test.js"
    main: true
    externs: "extern.purs"

build = (k) -> ->

  x   = paths[k]
  o   = options[k]
  psc = gulp-purescript.psc o
  lsc = gulp-livescript bare : true
  fil = gulp-filter (file) ->
    if k is "test" 
    then not /Main.purs/.test file.path 
    else not /Test/ig.test file.path 

  psc.on "error" ({message}) ->
    console.error message
    psc.end!

  gulp.src x.src 
    .pipe fil 
    .pipe gulp-if /.purs/, psc
    .pipe gulp-if /.ls/,   lsc
    .pipe gulp-concat o.output
    .pipe gulp-if (k is "prod"), gulp-uglify!
    .pipe gulp.dest x.dest

gulp.task "build:test" build "test"
gulp.task "test:unit" ->
  gulp.src options.test.output .pipe gulp-karma(
    configFile : "./karma.conf.ls"
    noColors   : true
    action     : "run"
  )

gulp.task "doc" ->
  gulp.src "src/**/*.purs"
    .pipe gulp-purescript.docgen!
    .pipe gulp.dest "README.md"

gulp.task "test" -> run-sequence "build:test" "test:unit"
# gulp.task "test" -> <[build:test]>
gulp.task "travis"  <[test]>
