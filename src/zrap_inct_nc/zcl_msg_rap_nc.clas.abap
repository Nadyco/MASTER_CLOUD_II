CLASS zcl_msg_rap_nc DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .
    INTERFACES if_abap_behv_message.

    CONSTANTS:
      BEGIN OF empty_title,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_NC',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_title,

      BEGIN OF empty_desc,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_NC',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_desc,

      BEGIN OF empty_priority,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_NC',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_priority,

      BEGIN OF empty_Creation_date,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_NC',
        msgno TYPE symsgno VALUE '004',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_Creation_date,

      BEGIN OF Future_date,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_NC',
        msgno TYPE symsgno VALUE '005',
        attr1 TYPE scx_attrname VALUE 'lv_datum',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF Future_date,

      BEGIN OF error_changedate,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_NC',
        msgno TYPE symsgno VALUE '006',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF error_changedate,

      BEGIN OF empty_status,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_NC',
        msgno TYPE symsgno VALUE '007',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_status,

      BEGIN OF error_status,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_NC',
        msgno TYPE symsgno VALUE '008',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF error_status,

      BEGIN OF empty_Responsable,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_NC',
        msgno TYPE symsgno VALUE '009',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF empty_Responsable,

      BEGIN OF error_Responsable,
        msgid TYPE symsgid VALUE 'ZRAP_MSG_NC',
        msgno TYPE symsgno VALUE '010',
        attr1 TYPE scx_attrname VALUE 'Responsable',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF error_Responsable.

    METHODS constructor
      IMPORTING
        textid      LIKE if_t100_message=>t100key OPTIONAL
        previous    LIKE previous OPTIONAL
        attr1       TYPE string OPTIONAL
        attr2       TYPE string OPTIONAL
        attr3       TYPE string OPTIONAL
        attr4       TYPE string OPTIONAL
        lv_datum    TYPE datum OPTIONAL
        Responsable TYPE zed_responsable_nc OPTIONAL
        severity    TYPE if_abap_behv_message=>t_severity .


    DATA: attr1       TYPE string,
          attr2       TYPE string,
          attr3       TYPE string,
          attr4       TYPE string,
          lv_datum    TYPE datum,
          Responsable TYPE zed_responsable_nc.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_msg_rap_nc IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.

    super->constructor( previous = previous ).

    me->attr1 = attr1.
    me->attr2 = attr2.
    me->attr3 = attr3.
    me->attr4 = attr4.
    me->lv_datum = lv_datum.
    me->Responsable = Responsable.

    if_abap_behv_message~m_severity = severity.

    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
