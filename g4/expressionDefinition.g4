grammar expressionDefinition;

prog : stat+;

stat: expression          # printExpr
    | NEWLINE             # blank
    ;

expression
   : multiplyingExpression ((PLUS | MINUS) multiplyingExpression)*
   ;

multiplyingExpression
   : powExpression ((TIMES | DIV) powExpression)*
   ;

powExpression
   : signedAtom (POW signedAtom)*
   ;

signedAtom
   : PLUS signedAtom
   | MINUS signedAtom
   | built_in_function
   | atom
   ;

built_in_function
  :  funcname LPAREN expression (COMMA expression)* RPAREN
  ;

funcname
  : SUM
  | AVG
  ;


atom
  : scientific
  | constant
  | LPAREN expression RPAREN
  | INT
  | variable
  ;

scientific
  : SCIENTIFIC_NUMBER
  ;

constant
  : PI
  | EULER
  ;

variable : VARIABLE ;


LPAREN : '(' ;
RPAREN : ')' ;
PLUS : '+' ;
MINUS : '-' ;
TIMES : '*' ;
DIV : '/' ;
GT : '>' ;
LT : '<' ;
EQ : '=' ;
COMMA : ',' ;
POINT : '.' ;
POW : '^' ;
PI : 'pi' ;
INT : [0-9]+ ;
NEWLINE:'\r'? '\n' ;

VARIABLE: [a-zA-Z]+[a-zA-Z0-9_]*;



SCIENTIFIC_NUMBER
   : NUMBER (('E' | 'e') SIGN? NUMBER)?
   ;


EULER : 'e' ;
SUM : '$sum' ;
AVG : '$avg' ;


fragment NUMBER
   : ('0' .. '9') + ('.' ('0' .. '9') +)?
   ;

fragment SIGN
   : ('+' | '-')
   ;
