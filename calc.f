\ get number
\ TODO: use ?DIGIT to verify num?
: getNum
  PAD 10 ACCEPT  \ get command line input
  PAD SWAP       \ uses length of cli to parse input
  EVALUATE       \ interpret the string as a number
;

\ get operation
: getOp
  PAD 1 ACCEPT
  PAD SWAP 
;

\ initialize variables
VARIABLE num1
VARIABLE num2
VARIABLE op
VARIABLE print

\ power calculation isn't built in
: power ( base exponent -- result )
  DUP 0 = IF
    DROP 1  \ Handle the case where the exponent is 0
  ELSE
    DUP 1 = IF
      DROP  \ Handle the case where the exponent is 1
    ELSE
      OVER OVER \ Multiply the base by itself (initial step)
      1-        \ Decrement the exponent
      RECURSE   \ Recursively call power with the decremented exponent
      *
    THEN
  THEN
;

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
  \ op 1 is addr len of input (assumes 1-char op)
  op 1 S" +" COMPARE 0= IF 
    num1 @ num2 @ + print ! \ add
  ELSE
    op 1 S" -" COMPARE 0= IF 
      num1 @ num2 @ - print ! \ subtract
    ELSE
      op 1 S" *" COMPARE 0= IF 
        num1 @ num2 @ * print ! \ multiply
      ELSE
        op 1 S" /" COMPARE 0= IF 
          num1 @ num2 @ / print ! \ divide
        ELSE
          op 1 S" ^" COMPARE 0= IF 
            num1 @ num2 @ power print ! \ power
          ELSE
            ." error" CR
          THEN
        THEN
      THEN
    THEN 
  THEN 
  
  print @ . CR

  BYE ;