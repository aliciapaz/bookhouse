module.exports = {
  env: {
    browser: true,
    es2020: true,
    jest: true,
    jquery: true
  },
  extends: [
    'standard',
    'eslint:recommended'
  ],
  parser: '@babel/eslint-parser',
  parserOptions: {
    ecmaVersion: 2020,
    ecmaFeatures: {
      impliedStrict: true,
      classes: false
    },
    sourceType: 'module'
  },
  ignorePatterns: [
    '.bundle/**/*',
    'node_modules/**/*',
    'public/**/*',
    'tmp/**/*',
    'vendor/bundle/**/*'
  ]
}
