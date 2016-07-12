axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
contentful   = require 'roots-contentful'
config       = require './contentful'
marked       = require 'marked'

module.exports =
  ignores: [
    'readme.md'
    '**/layout.*'
    '**/_*'
    '.gitignore'
    'contentful.*'
    'helpers/**'
  ]

  extensions: [

    js_pipeline
      files: 'assets/js/*.coffee'

    css_pipeline
      files: 'assets/css/*.styl'

    contentful(config)

  ]

  stylus:
    use: [axis(), rupture(), autoprefixer()]
    sourcemap: true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true

  locals:
    marked: marked
    config: config
    helpers:
      getPageName: require './helpers/get-page-name.js'

  server:
    clean_urls: true

  open_browser: false

