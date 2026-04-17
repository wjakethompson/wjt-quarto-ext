# WJT Contract Format

A template for contract consulting work.

## Installing

```bash
quarto use template wjakethompson/wjt-quarto-ext/wjt-contract
```

This will install the format extension and create an example qmd file that you can use as a starting place for your document.

## Using

The example qmd demonstrates the document options supported by the wjt-contract format (client, payment, etc.).
For example, your document options might look something like this:

```yaml
---
title: "CONSULTING AGREEMENT"
client:
  name: Jake Thompson
  company: ATLAS, University of Kansas
  building: Joseph R. Pearson Hall
  address: 1122 West Campus Road
  city: Lawrence, KS
  email: client@example.com
payment:
  fee: 200
  hourly: true
  date: !expr lubridate::today()
  complete: !expr lubridate::today() + lubridate::days(7)
format:
  wjt-contract-typst: default
---
```

WJT contract documents are rendered as follows:

![](wjt-contract.png)
