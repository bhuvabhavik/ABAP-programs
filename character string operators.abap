*&---------------------------------------------------------------------*
*& Report ZZbhavik_CHAR_OP
*&---------------------------------------------------------------------*
*&  Character string operators are essential tools in ABAP for string
*&  validation and manipulation.
*&  Understanding these operators allows you to perform complex string
*&  operations efficiently in your programs.
*&---------------------------------------------------------------------*
REPORT ZZbhavik_CHAR_OP.

data: A type String,
      B type String.

"---------------------  Charactor String Operator ---------------------"

" CO (Contains Only) : Checks whether A is solely composed of the characters in B.
A = 'AAA'.
B = 'A'.

IF A CO B. " true
  WRITE:/ 'A contains only characters from B'.
ELSE.
  WRITE:/ 'A contains characters not in B'.
ENDIF.

clear: A,B.


" CN (Not Contains ONLY)
" Checks whether string A contains any characters that are not in string B.

A = 'AB'.
B = 'B'.

IF A CN B. " true
  WRITE:/ 'A contains characters not in B'.
ELSE.
  WRITE:/ 'A contains only characters from B'.
ENDIF.

clear: A,B.


" CA (Contains ANY)
" Checks whether string A contains at least one character from string B.
A = 'HELLO'.
B = 'WORLD'.

IF A CA B. " True
  WRITE:/ 'A contains at least one character from B'.
ELSE.
  WRITE:/ 'A does not contain any characters from B'.
ENDIF.

clear: A,B.


" NA (NOT Contains Any)
" Checks whether string A does not contain any characters from string B.

A = 'HELLO'.
B = 'XYZ'.

IF A NA B. " True
  WRITE:/ 'A does not contain any characters from B'.
ELSE.
  WRITE:/ 'A contains at least one character from B'.
ENDIF.

CLEAR : A,B.


" CS (Contains a String)
" Checks whether string A contains the character string B.
A = 'HELLO WORLD'.
B = 'WORLD'.

IF A CS B. " True
  WRITE:/ 'A contains the string B'.
ELSE.
  WRITE:/ 'A does not contain the string B'.
ENDIF.

clear: A,B.

" NS (NOT Contains a String)
" Checks whether string A does not contain the character string B.
A = 'HELLO WORLD'.
B = 'EARTH'.

IF A NS B. " True
  WRITE:/ 'A does not contain the string B'.
ELSE.
  WRITE:/ 'A contains the string B'.
ENDIF.

CLEAR : A,B.


" CP (Contains a Pattern)
" Checks whether string A contains the pattern specified in string B.

A = 'HELLO123'.
B = 'HELLO*'.

IF A CP B. " True
  WRITE:/ 'A contains the pattern B'.
ELSE.
  WRITE:/ 'A does not contain the pattern B'.
ENDIF.

Clear: A,B.

" NP (NOT Contains a Pattern)
" Checks whether string A does not contain the pattern specified in string B.

A = 'HELLO123'.
B = 'WORLD*'.

IF A NP B. " True
  WRITE:/ 'A does not contain the pattern B'.
ELSE.
  WRITE:/ 'A contains the pattern B'.
ENDIF.

Clear: A,B.




" --------------- Pratical examples ------------ "

" ------------ Contains Only ---------"
DATA: coupon_code TYPE STRING VALUE 'ABC123',
      valid_chars TYPE STRING VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.

IF coupon_code CO valid_chars.
  WRITE: / 'Coupon code is valid'.
ELSE.
  WRITE: / 'Coupon code contains invalid characters'.
ENDIF.


" ---------- Not Contain only --------"
DATA: username TYPE STRING VALUE 'user@name',
      valid_chars1 TYPE STRING VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'.

IF username CN valid_chars1.
  WRITE: / 'Username contains invalid characters'.
ELSE.
  WRITE: / 'Username is valid'.
ENDIF.


" --------- Contains ANY -----------"
DATA: password TYPE STRING VALUE 'Password1!',
      special_chars TYPE STRING VALUE '!@#$%^&*'.

IF password CA special_chars.
  WRITE: / 'Password contains a special character'.
ELSE.
  WRITE: / 'Password does not contain any special characters'.
ENDIF.


" -------- Not Contain ANY ---------"
DATA: text TYPE STRING VALUE 'This is a clean text',
      forbidden_chars TYPE STRING VALUE '@s686'.

IF text NA forbidden_chars.
  WRITE: / 'Text does not contain any forbidden characters'.
ELSE.
  WRITE: / 'Text contains forbidden characters'.
ENDIF.


"--------- Contains a Strings ---------------"

DATA: title TYPE STRING VALUE 'Annual Financial Report 2024',
      keyword TYPE STRING VALUE 'Financial'.

IF title CS keyword.
  WRITE:/ 'The title contains the keyword'.
ELSE.
  WRITE:/ 'The title does not contain the keyword'.
ENDIF.


"-------  NOt Contains a Strings -----------"
DATA: subject TYPE STRING VALUE 'Meeting Confirmation',
      banned_phrase TYPE STRING VALUE 'Free Offer'.

IF subject NS banned_phrase.
  WRITE:/ 'The subject is acceptable'.
ELSE.
  WRITE:/ 'The subject contains a banned phrase'.
ENDIF.


"------- Contains Pattern -------------"
DATA: text_1 TYPE STRING VALUE 'Contact us at support@example.com',
      email_pattern TYPE STRING VALUE '*@*.*'.

IF text_1 CP email_pattern.
  WRITE:/ 'The text contains an email address'.
ELSE.
  WRITE:/ 'The text does not contain an email address'.
ENDIF.


" ------- Not Contains Pattern -----------"
DATA: description TYPE STRING VALUE 'This is a <b>bold</b> product description.',
      html_pattern TYPE STRING VALUE '*<*>*'.

IF description NP html_pattern.
  WRITE:/ 'The description is free of HTML tags'.
ELSE.
  WRITE:/ 'The description contains HTML tags'.
ENDIF.
