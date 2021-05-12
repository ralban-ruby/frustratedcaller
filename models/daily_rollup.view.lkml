view: daily_rollup {
  sql_table_name: "ACTIVITIES"."DAILY_ROLLUP"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: activity {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ACTIVITY_DATE" ;;
  }

  dimension: calls {
    type: number
    sql: ${TABLE}."CALLS" ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}."CLIENT_ID" ;;
  }

  dimension: client_uuid {
    type: string
    sql: ${TABLE}."CLIENT_UUID" ;;
  }

  dimension: company_id {
    type: number
    sql: ${TABLE}."COMPANY_ID" ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}."COMPANY_NAME" ;;
  }

  dimension: company_uuid {
    type: string
    sql: ${TABLE}."COMPANY_UUID" ;;
  }

  dimension: minutes {
    type: number
    sql: ${TABLE}."MINUTES" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, company_name]
  }
  measure: sum_total_calls {
    type: sum
    sql: ${calls} ;;
  }
}
