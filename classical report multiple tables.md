```abap
REPORT zprg3_creport_2table_bb.

TYPES: BEGIN OF lty_data,
         ono   TYPE zdeono__28,
         odate TYPE zdeodate__28,
         pm    TYPE zdepm__28,
         curr  TYPE zdecur__28,
       END OF lty_data.

DATA: lt_data TYPE TABLE OF lty_data.
DATA: lwa_data TYPE lty_data.

TYPES: BEGIN OF lty2_data,
         ono   TYPE zdeono__28,
         oin   TYPE zdeoitmno__28,
         icost TYPE zdeitmcost__28,
       END OF lty2_data.

DATA: lt2_data TYPE TABLE OF lty2_data.
DATA: lwa2_data TYPE lty2_data.
DATA: lv_ono TYPE zdeono__28.

SELECT-OPTIONS s_ono FOR lv_ono.

SELECT ono odate pm curr
  FROM zordh__28
  INTO TABLE lt_data
  WHERE ono IN s_ono.

IF lt_data IS NOT INITIAL.
  SELECT ono oin icost
    FROM zori_28
    INTO TABLE lt2_data
    FOR ALL ENTRIES IN lt_data
    WHERE ono = lt_data-ono.
ENDIF.


TYPES: BEGIN OF lty_final,
         ono   TYPE zdeono__28,
         odate TYPE zdeodate__28,
         pm    TYPE zdepm__28,
         curr  TYPE zdecur__28,
         oin   TYPE zdeoitmno__28,
         icost TYPE zdeitmcost__28,
       END OF lty_final.

DATA: lt_final TYPE TABLE OF lty_final.
DATA: lwa_final TYPE lty_final.

DATA: lv_flag TYPE boolean.
"merging 2 internal table data into final internal table.
LOOP AT lt_data INTO lwa_data.
  LOOP AT lt2_data INTO lwa2_data WHERE ono = lwa_data-ono.
    lwa_final-ono = lwa_data-ono.
    lwa_final-odate = lwa_data-odate.
    lwa_final-pm = lwa_data-pm.
    lwa_final-curr = lwa_data-curr.
    lwa_final-oin = lwa2_data-oin.
    lwa_final-icost = lwa2_data-icost.
    APPEND lwa_final TO lt_final.
    CLEAR: lwa_final.
    lv_flag = 'X'.
  ENDLOOP.
  IF lv_flag = ' '.
    lwa_final-ono = lwa_data-ono.
    lwa_final-odate = lwa_data-odate.
    lwa_final-pm = lwa_data-pm.
    lwa_final-curr = lwa_data-curr.
    APPEND lwa_final TO lt_final.
    CLEAR: lv_flag.
  ENDIF.

ENDLOOP.

LOOP AT lt_final INTO lwa_final.
  WRITE:/ lwa_final-ono, lwa_final-oin, lwa_final-odate,
           lwa_final-pm, lwa_final-icost, lwa_final-curr.
ENDLOOP.
```
