view: link {
  sql_table_name: "ACTIVITIES"."LINK"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}."INDUSTRY" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
