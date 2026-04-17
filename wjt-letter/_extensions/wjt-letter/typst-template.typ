// This function gets your whole document as its `body`
// and formats it as a simple letter.
#let letter(
  // The logo for the header
  header-logo: none,

  // The letter's sender, which is display at the top of the page.
  sender: none,

  // The letter's recipient, which is displayed close to the top.
  recipient: none,

  // The date, displayed to the right.
  date: none,

  // The subject line.
  subject: none,

  // The short title for the header
  shorttitle: none,

  // The report type for the header
  reporttype: none,

  // The name with which the letter closes.
  name: none,

  // The letter's content.
  body
) = {
  // Configure page and text properties.
  set text(font: "Source Sans Pro", 11pt)
  set page(
    paper: "us-letter",
    margin: 1in,
    header-ascent: 10%
  )

  set page(footer: context [
    #set align(right)
    #counter(page).display(
        "1 / 1",
        both: true
      )
  ])
  
  set page(header: context {
    if counter(page).get().first() <= 1 [
      #grid(
        columns: (1fr, 2in),
        rows: 1,
        none,
        image(header-logo)
      )
    ] else [
      #let headertext = text(
        [
          #if shorttitle == none {none} else {shorttitle}
          #if shorttitle != none [ \ ]
          #if reporttype == none {none} else {reporttype}
        ]
      )

      #let img = image(header-logo, width: 1.5in)
      #let img-size = measure(img)
      
      #grid(
        columns: (img-size.width, 1fr),
        rows: (img-size.height, 10pt),
        image(header-logo),
        align(right, headertext),
        none,
        none
      )
    ]
  })
  

  // Display sender at top of page. If there's no sender
  // add some hidden text to keep the same spacing.
  text(9pt, if sender == none {
    hide("a")
  } else {
    align(right, sender)
  })

  v(0.5cm)

  // Display recipient.
  recipient

  v(0.5cm)

  // Display date. If there's no date add some hidden
  // text to keep the same spacing.
  align(right, if date != none {
    date
  } else {
    hide("a")
  })

  v(0.5cm)

  // Add the subject line, if any.
  if subject != none {
    pad(right: 10%, left: 10%, align(center, strong(subject)))
  }
  
  if reporttype != none {
    pad(right: 10%, left: 10%, align(center, strong(reporttype)))
  }

  // Add body and name.
  body
  v(1.25cm)
  name
}
