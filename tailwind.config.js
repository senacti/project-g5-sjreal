/** @type {import('tailwindcss').Config} */

module.exports = {
  content: ["*.{html,js}"],
  theme: {
    colors: {
      primario: {
        base: 'rgb(var(--color-primario) / <alpha-value>)',
        100: 'rgb(var(--color-p-lightest) / <alpha-value>)',
        200: 'rgb(var(--color-p-lighter) / <alpha-value>)',
        300: 'rgb(var(--color-p-darker) / <alpha-value>)'        
      },
      secundario: {
        base: 'rgb(var(--color-secundario) / <alpha-value>)',
        100: 'rgb(var(--color-s-lightest) / <alpha-value>)',
        200: 'rgb(var(--color-s-lighter) / <alpha-value>)',
        300: 'rgb(var(--color-s-darker) / <alpha-value>)'
      }
    },
    extend: {
      fontFamily: {
        parrafo: 'Montserrat, sans-serif',
        subtitulo: 'Rubik, sans-serif',
        titulo: 'Archivo Black'
      }
    }
  },
  plugins: [],
}

