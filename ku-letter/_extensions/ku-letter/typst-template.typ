// This function gets your whole document as its `body`
// and formats it as a simple letter.
#let letter(
  // The subject line.
  subject: none,
  
  // The letter's recipient, which is displayed close to the top.
  recipient: none,
  
  // The letter's sender, which is display at the top of the page.
  sender: none,

  // The logo for the header
  header-logo: none,
  
  // The logo for the footer
  footer-logo: none,

  // The date, displayed to the right.
  date: none,

  // The letter's content.
  body
) = {
  // Configure page and text properties.
  show link: underline
  show link: set text(blue)
  set text(font: "Calibri", 12pt)
  set page(
    paper: "us-letter",
    margin: (top: 1in, right: 1in, bottom: 1.5in, left: 1in),
    header-ascent: 10%,
    footer-descent: 30%
  )
  
  set page(header: locate(loc => {
    if counter(page).at(loc).first() <= 1 [
      #style(styles => {
      if header-logo == none {
        return
      }

      let img = image(header-logo, width: 4in)
      let img-size = measure(img, styles)

      grid(
        columns: (img-size.width, 1fr),
        rows: 1,
        pad(left: -0.5in, img),
        none
      )
      })
    ] 
  }))
  
  set page(footer: locate(loc => {
    if counter(page).at(loc).first() <= 1 [
      #style(styles => {
      if footer-logo == none {
        return
      }

      let img = image(footer-logo, width: 1.1in)
      let img-size = measure(img, styles)
      
      let linkedin-logo = image("linkedin.svg", width: 0.4cm)
      let x-logo = image("x.svg", width: 0.4cm)
      let linkedin-size = measure(linkedin-logo, styles)
      let x-size = measure(x-logo, styles)

      pad(top: -0.22in, left: -0.5in, line(
        start: (0in, 0in),
        length: 7.5in,
        stroke: (paint: rgb("#002060"))
      ))
      
      grid(
        columns: (1fr, img-size.width),
        rows: 1,
        pad(left: -0.5in, [
          431 Joseph R. Pearson Hall, Lawrence, KS 66045-7575 \
          #link("https://atlas.ku.edu")[atlas.ku.edu] | (785) 864-7093 | #link("mailto:atlas-aai@ku.edu") \
          #pad(top: -6pt, grid(
            columns: (linkedin-size.width, x-size.width, 1fr),
            column-gutter: 10pt,
            rows: 1,
            linkedin-logo,
            x-logo,
            [\@atlas4learning]
          ))
        ]),
        none
      )
      })
    ] else [
      #style(styles => {
      if footer-logo == none {
        return
      }

      let img = image(footer-logo, width: 1.1in)
      let img-size = measure(img, styles)
      
      let linkedin-logo = image("linkedin.svg", width: 0.4cm)
      let x-logo = image("x.svg", width: 0.4cm)
      let linkedin-size = measure(linkedin-logo, styles)
      let x-size = measure(x-logo, styles)

      pad(top: -0.22in, left: -0.5in, line(
        start: (0in, 0in),
        length: 7.5in,
        stroke: (paint: rgb("#002060"))
      ))
      
      grid(
        columns: (1fr, img-size.width),
        rows: 1,
        pad(left: -0.5in, [
          431 Joseph R. Pearson Hall, Lawrence, KS 66045-7575 \
          #link("https://atlas.ku.edu")[atlas.ku.edu] | (785) 864-7093 | #link("mailto:atlas-aai@ku.edu") \
          #pad(top: -6pt, grid(
            columns: (linkedin-size.width, x-size.width, 1fr),
            column-gutter: 10pt,
            rows: 1,
            linkedin-logo,
            x-logo,
            [\@atlas4learning]
          ))
        ]),
        pad(top: -0.1in, left: 0.5in, img)
      )
      })
    ]
  }))
  
  // Display date. If there's no date add some hidden
  // text to keep the same spacing.
  align(left, if date != none {
    date
  } else {
    hide("a")
  })
  
  v(0.5em)
  
  // Display recipient.
  recipient
  
  v(0.5em)
  
  // Add the subject line, if any.
  text(
    [
      #if subject == none {none} else [Re: ]
      #if subject == none {none} else {subject}
    ]
  )
  
  v(0.5em)

  // Add body and name.
  body
  v(1.25cm)
  sender
}
