CLASS zcl_read_eml_rap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
*    DATA: lv_oper TYPE c VALUE 'R'.
    DATA: lv_oper TYPE c VALUE 'C'.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_read_eml_rap IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CASE lv_oper .
      WHEN 'R'.
        READ ENTITIES OF  zcds_entity_srs_45
        ENTITY travel ALL FIELDS WITH VALUE #( ( travelId = '00000024' )
                                               ( travelId = '00000026' )
                                               ( travelId = '29292929' ) )
          RESULT DATA(it_result)
          FAILED DATA(it_failed)
          REPORTED DATA(it_report).
        out->write(
          EXPORTING
            data   =  it_result ).

        out->write(
          EXPORTING
            data   =   it_failed ).

        out->write(
          EXPORTING
            data   =  it_report ).
      WHEN 'D'.
      WHEN 'C'.

        DATA(lv_des) = 'DURGA PUJA' .
        DATA(lv_agn) = '097856' .
        DATA(lv_cust) = '345690' .

        MODIFY ENTITIES OF zcds_entity_srs_45 IN LOCAL MODE
        ENTITY travel
        CREATE FIELDS ( TravelId AgencyId CustomerId BeginDate EndDate Description OverallStatus )
        WITH VALUE #( ( %cid     = '565656'
                        TravelId = '00343434'
                        AgencyId = lv_agn
                        CustomerId = lv_cust
*                        BeginDate = cl_abap_context_info=>get_system_date(  )
*                        EndDate  =  cl_abap_context_info=>get_system_date(  ) + 30
                        Description = lv_des
                        OverallStatus = 'O' )
                        ( %cid     = '565656'
                        TravelId = '00363636'
                        AgencyId = lv_agn
                        CustomerId = lv_cust
*                        BeginDate = cl_abap_context_info=>get_system_date(  )
*                        EndDate  =  cl_abap_context_info=>get_system_date(  ) + 30
                        Description = lv_des
                        OverallStatus = 'P' )
                        ( %cid     = '565656'
                         TravelId = '00383488'
                        AgencyId = lv_agn
                        CustomerId = lv_cust
*                        BeginDate = cl_abap_context_info=>get_system_date(  )
*                        EndDate  =  cl_abap_context_info=>get_system_date(  ) + 30
                        Description = lv_des
                        OverallStatus = 'O' )
                         )

MAPPED DATA(lt_mapped)
FAILED DATA(it_failed1)
REPORTED DATA(it_rept).

        COMMIT ENTITIES.
        out->write(
          EXPORTING
            data   =  lt_mapped ).

        out->write(
          EXPORTING
            data   =   it_failed1 ).

        out->write(
          EXPORTING
            data   =  it_rept ).

      WHEN 'D'.
    ENDCASE.

  ENDMETHOD.
ENDCLASS.
