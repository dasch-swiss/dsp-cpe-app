const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './dist/index.html',
    './dist/app.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [],
}