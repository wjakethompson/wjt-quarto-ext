# WJT Letter Format

Based on the KU letterhead format for Accessible Teaching, Learning, and Assessment Systems.

**NOTE**: This format requires the pre-release version of Quarto v1.4, which you can download here: <https://quarto.org/docs/download/prerelease>.

## Installing

```bash
quarto use template wjakethompson/wjt-quarto-ext/wjt-letter
```

This will install the format extension and create an example qmd file that you can use as a starting place for your document.

## Using

The example qmd demonstrates the document options supported by the wjt-letter format (subject, recipient, logo, etc.).
For example, your document options might look something like this:

```yaml
---
subject: "Consultation Report Title"
shorttitle: "Short Title"
reporttype: "Report Type"
name: |
  W. Jake Thompson, Ph.D.
logo: "consulting-logo.png"
sender: |
  12261 S Crest Drive Olathe, KS 66061 \
  wjakethompson@gmail.com \
  (785) 643-9244
recipient: |
  Mr. John Doe \
  Acme Corp. \
  123 Glennwood Ave \
  Quarto Creek, VA 22438 \
sent: "September 4, 2016"
format:
  wjt-letter-typst: default
---
```

WJT letter documents are rendered as follows:

![](wjt-letter.png)

