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
VARIABLE num1
VARIABLE num2
VARIABLE op
VARIABLE print

\ calculate
: calc
  \ get numbers
  ." Enter two numbers" CR
  getNum num1 !
  getNum num2 !

  \ get operation
  CR ." Enter the operation to perform" CR
  getOp op SWAP MOVE \ parse op as string
  CR \ newline

  \ calculate
  op 1                     \ addr len of input (assumes 1-char op)
  S" +" COMPARE 0= 
  IF num1 @ num2 @ + print ! 
  THEN print @ . CR

  bye ;