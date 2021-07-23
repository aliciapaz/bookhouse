const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  // uncomment below for bootstrap 4.x
  // Popper: ['popper.js', 'default']
  // uncomment below for bootstrap 5
  Popper: ['@popperjs/core', 'default']
}))

module.exports = environment