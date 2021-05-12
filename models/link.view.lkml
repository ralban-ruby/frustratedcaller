view: link {
  sql_table_name: "ACTIVITIES"."LINK"
    ;;


  dimension: PRL_COMPANY_ID_C {
    primary_key: yes
    type: string
    sql: ${TABLE}."PRL_COMPANY_ID_C" ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  measure: count {
    type: count

  }
}
