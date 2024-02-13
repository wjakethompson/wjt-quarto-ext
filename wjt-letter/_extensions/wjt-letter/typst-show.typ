#show: doc => letter(
$if(sender)$
  sender: [$sender$],
$endif$
$if(logo)$
  logo: "$logo$",
$endif$
$if(recipient)$
  recipient: [$recipient$],
$endif$
$if(sent)$
  date: [$sent$],
$endif$
$if(subject)$
  subject: [$subject$],
$endif$
$if(shorttitle)$
  shorttitle: [$shorttitle$],
$endif$
$if(reporttype)$
  reporttype: [$reporttype$],
$endif$
$if(name)$
  name: [$name$],
$endif$
  doc,
)
