```abap
the objective is to get the output with 2 columns id and cost for example id 1 has done total shopping of x amount (the total of all the item cost)



" inital data table s
types : BEGIN OF ty_item,
      id  type  i,
      item(10) type c,
      cost TYPE p DECIMALS 2,
      END OF ty_item.

" final output table s
types : BEGIN OF ty_final,
      id  type  i,
      total TYPE p DECIMALS 2,
      END OF ty_final.


" declare
data : wa_item type ty_item,
       it_item type TABLE OF ty_item.

data : wa_final type ty_final,
       it_final type TABLE OF ty_final.


" fill data

wa_item-id = 1.
wa_item-item = 'abc'.
wa_item-cost = '132.90'.
APPEND wa_item to it_item.

wa_item-id = 1.
wa_item-item = 'bcq'.
wa_item-cost = '198.90'.
APPEND wa_item to it_item.

wa_item-id = 2.
wa_item-item = 'xZy'.
wa_item-cost = '34.90'.
APPEND wa_item to it_item.

wa_item-id = 1.
wa_item-item = 'abc'.
wa_item-cost = '132.90'.
APPEND wa_item to it_item.

wa_item-id = 2.
wa_item-item = 'abc'.
wa_item-cost = '92.90'.
APPEND wa_item to it_item.

" sorting for binary search
sort : it_item by id.


" create a copy of item table to get list of id
DATA : it_id  TYPE TABLE OF ty_item,
       wa_id  TYPE  ty_item.

       it_id = it_item.



" remove depulicate id to get only unique.
DELETE ADJACENT DUPLICATES FROM it_id COMPARING id.


****       Parallel Cursor   ****

" temporary variable
DATA : lv_index TYPE i,
      lv_total TYPE p DECIMALS 2.

LOOP AT it_id into wa_id.

  " GET THE INDEX OF CURRENT ID.
  READ TABLE it_item INTO wa_item WITH  KEY ID = wa_id-id.
  IF SY-SUBRC = 0.
    " STORE INDEX IN TEMPORARY VRIABLE
   LV_INDEX = SY-TABIX.
  ENDIF.

  " CALACULATE TOTATL COST FOR CURRENT ID.
  LOOP AT IT_ITEM INTO WA_ITEM FROM LV_INDEX.
    IF WA_ITEM-ID <> WA_ID-ID.
        EXIT.
    ENDIF.
    LV_TOTAL = LV_TOTAL + WA_ITEM-cost.
    LV_INDEX = LV_INDEX + 1.
  ENDLOOP.

  " APPEND FINAL RESULT TO FINAL TABLE
  WA_FINAL-ID = WA_ID-ID.
  WA_FINAL-total = LV_TOTAL.
  APPEND WA_FINAL TO IT_FINAL.

  " CLEAR TEMPORARY VARIABLES AND WORK AREAS.
  CLEAR : WA_FINAL,LV_TOTAL, LV_INDEX.
ENDLOOP.

********     **********

" DISPLAY FINAL TABLE .
WRITE : TEXT-001  , 30 TEXT-002.

LOOP AT IT_FINAL INTO WA_FINAL.
  WRITE :/ WA_FINAL-id UNDER TEXT-001 , WA_FINAL-total UNDER TEXT-002.
ENDLOOP.


*" DISPLAY FINAL TABLE DATA.
*cl_demo_output=>display_data( IT_FINAL ).


```
