: getNum
  PAD 1 ACCEPT  \ get command line input
  PAD SWAP      \ uses length of cli to parse input
  EVALUATE ;    \ interpret the string as a number

: calc
  ." Enter a number" CR
  getNum . CR
  bye ;