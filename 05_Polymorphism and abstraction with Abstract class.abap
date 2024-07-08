*&---------------------------------------------------------------------*
*& Report zzbhavik_oop_8
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zzbhavik_oop_8.

CLASS cl_computer DEFINITION ABSTRACT.
  PUBLIC SECTION.
    " Abstract method definition for coding
    METHODS coding ABSTRACT.
ENDCLASS.


CLASS cl_laptop DEFINITION INHERITING FROM cl_computer.
  PUBLIC SECTION.
  " Redefining abstract method from superclass
    METHODS coding REDEFINITION.
ENDCLASS.


CLASS cl_laptop IMPLEMENTATION.
  " Implementation specific to laptops
  METHOD coding.
    WRITE: / 'Code, compile, run'.
  ENDMETHOD.
ENDCLASS.


CLASS cl_desktop DEFINITION INHERITING FROM cl_computer.
  PUBLIC SECTION.
  " Redefining abstract method from superclass
    METHODS coding REDEFINITION.
ENDCLASS.


CLASS cl_desktop IMPLEMENTATION.
  " Implementation specific to desktops
  METHOD coding.
    WRITE: / 'Code, compile, run faster'.
  ENDMETHOD.
ENDCLASS.


CLASS developer DEFINITION.
  PUBLIC SECTION.
   " Method to work on any computer
    METHODS : work IMPORTING ln_comp TYPE REF TO cl_computer.
ENDCLASS.


CLASS developer IMPLEMENTATION.
  METHOD work.
   " Calling coding method polymorphically
    ln_comp->coding( ).
  ENDMETHOD.
ENDCLASS.


START-OF-SELECTION.
  " Creating an instance of cl_laptop
  DATA(laptop) = NEW cl_laptop( ).

  " Creating an instance of cl_desktop
  DATA(desktop) = NEW cl_desktop( ).

  " Creating an instance of developer
  DATA(abaper) = NEW developer( ).

  " Calling work method with laptop instance
  abaper->work( laptop ).
  " Calling work method with desktop instance
  abaper->work( desktop ).


"---------- Note ----------"
* - The program defines different types of computers (laptop and desktop)
*   inheriting from a common abstract definition (computer).

* - Each computer type can perform a specific action (coding).

* - A developer class uses these computers interchangeably,
*   demonstrating how a common interface simplifies using different computer types.

* - This setup shows how abstraction helps manage complexity by focusing
*   on what each type of computer can do, promoting code organization and reuse.  abaper->work( desktop ).
