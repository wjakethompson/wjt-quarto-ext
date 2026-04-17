#show: doc => contract(
$if(client.name)$
  client-name: [$client.name$],
$endif$
$if(client.company)$
  client-company: [$client.company$],
$endif$
$if(client.building)$
  client-building: [$client.building$],
$endif$
$if(client.address)$
  client-address: [$client.address$],
$endif$
$if(client.city)$
  client-city: [$client.city$],
$endif$
$if(client.email)$
  client-email: [$client.email$],
$endif$
$if(payment.fee)$
  payment-fee: [$payment.fee$],
$endif$
$if(payment.hourly)$
  payment-hourly: [$payment.hourly$],
$endif$
$if(payment.date)$
  payment-date: [$payment.date$],
$endif$
$if(payment.complete)$
  payment-complete: [$payment.complete$],
$endif$
  doc,
)
