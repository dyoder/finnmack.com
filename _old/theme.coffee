hex = (value) -> "##{value}"

module.exports = 
  
  colors:
    foreground: hex "333"
    background: hex "fefefe"
    logo: hex "789"
    link: hex "8b2"
    success:
      foreground: hex "fefefe"
      background: hex "9c3"
    alert:
      foreground: hex "fefefe"
      background: hex "c93"
  fonts:
    special: "'Exo', sans-serif"
    headings: "'Oxygen', sans-serif"
    labels: "'Oxygen', sans-serif"
    body: "'Gentium Basic', serif"