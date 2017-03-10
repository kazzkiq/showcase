// See http://brunch.io for documentation.
module.exports = {
  npm: {
    globals: {
      riot: 'riot',
      route: 'riot-route'
    }
  },
  files: {
    javascripts: {joinTo: 'app.js'},
    stylesheets: {joinTo: 'app.css'}
  },
  plugins: {
    on: ['riot'],
    riot: {
      pattern: /\.tag$/
    }
  },
  babel: {
    presets: ['es2015'],
    plugins: ['transform-async-to-generator']
  },
  modules: {
    autoRequire: { 'app.js': ['initialize'] }
  }
};
