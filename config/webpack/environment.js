const { environment } = require('@rails/webpacker')

module.exports = environment

// jQueryとBootstrapのJSを使えるようにする
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  })
)