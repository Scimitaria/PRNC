: getNum
  PAD 10 ACCEPT  \ get command line input
  PAD SWAP       \ uses length of cli to parse input
  EVALUATE ;     \ interpret the string as a number
  \ TODO: use ?DIGIT to verify num?

: getOp
  PAD 1 ACCEPT
  PAD SWAP ;

: calc
  ." Enter two numbers" CR
  getNum getNum + . CR
  ." Enter the operation to perform" CR
  getOp TYPE CR
  bye ;