#my abap notes


alv report using manual field catalog
![image](https://github.com/bhuvabhavik/ABAP/assets/49744703/33b9f8ca-c463-44d6-9dd9-7d170c974dc7)
https://gist.github.com/bhuvabhavik/e83492d4a244c186cd1ff63a78d44fee


Modify the Field Catalog Provided by REUSE_ALV_FIELDCATALOG_MERGE

![image](https://github.com/bhuvabhavik/ABAP/assets/49744703/6d376371-bec0-4f8b-8f3f-4d58812ac8c6)



sorted ALV
step 1: add this in display function
 it_sort = lt_sort
step 2: define and declare
 DATA: lt_sort TYPE SLIS_T_SORTINFO_ALV,ls_sort TYPE slis_sortinfo_alv.
step 3:
just above the function call declare sorting paramneters
ls_sort-fieldname = 'TA'.
ls_sort-down = 'X'.
APPEND ls_Sort to lt_sort.



