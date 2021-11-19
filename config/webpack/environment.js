const { environment } = require('@rails/webpacker')

// jQueryとBootstrapのJSを使えるように
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  })
)

module.exports = environment
