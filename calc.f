\ get number
: getNum
  PAD 10 ACCEPT  \ get command line input
  PAD SWAP       \ uses length of cli to parse input
  EVALUATE ;     \ interpret the string as a number
  \ TODO: use ?DIGIT to verify num?

\ get operation
: getOp
  PAD 1 ACCEPT
  PAD SWAP ;

\ initialize variables
0 VALUE num1
0 VALUE num2
0 VALUE op

\ calculate
: calc
  ." Enter two numbers" CR
  getNum TO num1
  getNum TO num2
  num1 num2 + . CR
  ." Enter the operation to perform" CR
  getOp TO op
  op TYPE CR
  bye ;