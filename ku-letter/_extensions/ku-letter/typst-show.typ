#show: doc => letter(
$if(subject)$
  subject: [$subject$],
$endif$
$if(recipient)$
  recipient: [$recipient$],
$endif$
$if(sender)$
  sender: [$sender$],
$endif$
$if(header-logo)$
  header-logo: "$header-logo$",
$endif$
$if(footer-logo)$
  footer-logo: "$footer-logo$",
$endif$
$if(date)$
  date: [$date$],
$endif$
  doc,
)
