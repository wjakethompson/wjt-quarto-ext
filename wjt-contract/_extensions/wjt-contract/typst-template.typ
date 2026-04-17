// This function gets your whole document as its `body`
// and formats it as a simple letter.
#let contract(
  client-name: none,
  client-company: none,
  client-building: none,
  client-address: none,
  client-city: none,
  client-email: none,

  payment-fee: none,
  payment-hourly: none,
  payment-date: none,
  payment-complete: none,

  // The contract's content.
  body
) = {
  // Configure page and text properties.
  set text(font: "Source Sans Pro", 11pt)
  set page(
    paper: "us-letter",
    margin: 1in,
  )

  set page(footer: context [
    #set align(right)
    #text("Page")
    #counter(page).display(
        "1 of 1",
        both: true
      )
  ])

  // Title formatting
  show title: set align(center)

  // Heading formatting
  show heading: set text(
    size: 12pt,
    weight: "bold"
  )
  show heading: set block(
    above: 1.5em,
    below: 1.5em
  )

  // List formatting
  //show list: set block(above: 0em, below: 1.5em)
  let block-spacing-active = state("block-spacing-active", false)
  show enum.item: it => {
    show block: blk => context {
      if block-spacing-active.get() {
        blk
      } else {
        block-spacing-active.update(_ => true)
        v(-.1em)
        blk
        block-spacing-active.update(_ => false)
        v(.75em)
      }
    }
    it
  }

  // Start of contract
  title("CONSULTING AGREEMENT")

  // Add body
  body

  v(4em)
  grid(
    stroke: 0pt,
    columns: (1in, 1fr, 1in),
    rows: (2em, 3em, 4em, 2em, 3em),
    [#align(right + bottom, "Signed: ")],
    [#align(bottom, line(length: 90%))],
    [#align(bottom, line(length: 100%))],
    none,
    [
      #v(.5em)
      #client-name\
      #text(client-company, size: 9pt)
    ],
    [#v(.5em) Date],
    none, none, none,
    [#align(right + bottom, "Signed: ")],
    [#align(bottom, line(length: 90%))],
    [#align(bottom, line(length: 100%))],
    none,
    [
      #v(.5em)
      W. Jake Thompson, Ph.D.\
      #text("Jake Thompson Consulting", size: 9pt)
    ],
    [#v(.5em) Date]
  )
}
