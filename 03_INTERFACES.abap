*&---------------------------------------------------------------------*
*& Report zzbhavik_oop_8
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zzbhavik_oop_9.

INTERFACE in_computer.
  " Interface method declaration for coding
  METHODS: coding.
ENDINTERFACE.

CLASS cl_laptop DEFINITION .
  PUBLIC SECTION.
  " Implementing in_computer interface
  INTERFACES: in_computer.
ENDCLASS.



CLASS cl_laptop IMPLEMENTATION.
  " Implementation specific to laptops
  METHOD in_computer~coding.
    WRITE: / 'Code, compile, run'.
  ENDMETHOD.
ENDCLASS.


CLASS cl_desktop DEFINITION.
  PUBLIC SECTION.
  " Implementing in_computer interface
 INTERFACES: in_computer.
ENDCLASS.


CLASS cl_desktop IMPLEMENTATION.
  " Implementation specific to desktops
  METHOD in_computer~coding.
    WRITE: / 'Code, compile, run faster'.
  ENDMETHOD.
ENDCLASS.


CLASS developer DEFINITION.
  PUBLIC SECTION.
   " Method to work on any computer
    METHODS : work IMPORTING ln_comp TYPE REF TO in_computer.  "in_computer->interface
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


"---------- Notes ----------"
* - Defines an interface in_computer with a method coding that both cl_laptop and cl_desktop classes implement.

* - Each computer type provides its specific coding implementation tailored to laptops and desktops.

* - The developer class utilizes these computers through the in_computer interface,
*   showcasing how interfaces simplify the usage of different computer types.

* - This structure highlights how abstraction through interfaces manages complexity by focusing
*   on defining common behaviors, promoting code organization and reuse.
