CLASS zcl_lab_02_product_815 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "creamos dos metodos de instancia
    METHODS:
      set_product IMPORTING iv_product TYPE matnr,
      set_creationdate  IMPORTING iv_creation_date TYPE zdate.



  PROTECTED SECTION.
  PRIVATE SECTION.
    " declaracion de atributos de instancia
    DATA: lv_product     TYPE matnr,
          lv_create_date TYPE zdate.

ENDCLASS.



CLASS zcl_lab_02_product_815 IMPLEMENTATION.

  METHOD set_creationdate.
    lv_create_date = iv_creation_date.
  ENDMETHOD.

  METHOD set_product.
    lv_product = iv_product.
  ENDMETHOD.

ENDCLASS.
