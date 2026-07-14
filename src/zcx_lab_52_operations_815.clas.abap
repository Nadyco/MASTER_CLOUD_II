CLASS zcx_lab_52_operations_815 DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      BEGIN OF zcx_no_execute,
        msgid TYPE symsgid VALUE 'ZABAP_MSG',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'attr1',
        attr2 TYPE scx_attrname VALUE 'attr2',
        attr3 TYPE scx_attrname VALUE 'attr3',
        attr4 TYPE scx_attrname VALUE 'attr4',
      END OF zcx_no_execute.

    CONSTANTS:
      BEGIN OF zcx_no_access,
        msgid TYPE symsgid VALUE 'ZABAP_MSG',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'attr1',
        attr2 TYPE scx_attrname VALUE 'attr2',
        attr3 TYPE scx_attrname VALUE 'attr3',
        attr4 TYPE scx_attrname VALUE 'attr4',
      END OF zcx_no_access.

    DATA: attr1 TYPE scx_attrname,
          attr2 TYPE scx_attrname,
          attr3 TYPE scx_attrname,
          attr4 TYPE scx_attrname.


METHODS constructor
  IMPORTING
    textid LIKE if_t100_message=>t100key OPTIONAL
    previous LIKE previous OPTIONAL
    attr1 TYPE SCX_ATTRNAME OPTIONAL
    attr2 TYPE SCX_ATTRNAME OPTIONAL
    attr3 TYPE SCX_ATTRNAME OPTIONAL
    attr4 TYPE SCX_ATTRNAME OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_lab_52_operations_815 IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.

    super->constructor( previous = previous ).

    me->attr1 = attr1.
    me->attr2 = attr2.
    me->attr3 = attr3.
    me->attr4 = attr4.

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
