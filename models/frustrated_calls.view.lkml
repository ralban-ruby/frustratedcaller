view: frustrated_calls {
  sql_table_name: "ACTIVITIES"."FRUSTRATED_CALLS"
    ;;

  dimension: call_id {
    type: number
    primary_key: yes
    sql: ${TABLE}."CALL_ID" ;;
  }

  dimension: call_result_description {
    type: string
    sql: ${TABLE}."CALL_RESULT_DESCRIPTION" ;;
  }

  dimension: call_tag_description {
    type: string
    sql: ${TABLE}."CALL_TAG_DESCRIPTION" ;;
  }

  dimension: calltimeroundedseconds {
    type: string
    sql: ${TABLE}."CALLTIMEROUNDEDSECONDS" ;;
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

  dimension_group: date_pst {
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
    sql: ${TABLE}."DATE_PST" ;;
  }

  dimension: from_company {
    type: string
    sql: ${TABLE}."FROM_COMPANY" ;;
  }

  dimension: from_name {
    type: string
    sql: ${TABLE}."FROM_NAME" ;;
  }

  dimension: from_number {
    type: string
    sql: ${TABLE}."FROM_NUMBER" ;;
  }

  dimension: receptionist_description {
    type: string
    sql: ${TABLE}."RECEPTIONIST_DESCRIPTION" ;;
  }

  dimension: rubycallid {
    type: string
    sql: ${TABLE}."RUBYCALLID" ;;
  }

  dimension_group: start_time_utc {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}."START_TIME_UTC" AS TIMESTAMP_NTZ) ;;
  }

  measure: count {
    type: count
    drill_fields: [from_name, company_name]
  }

  measure: sum_f_calls {
    type: count_distinct
    sql: ${call_id} ;;
  }

  measure: fcallratio {
    type: number
    sql: ${sum_f_calls}/ ${daily_rollup.sum_total_calls} ;;
    value_format: "0%"
  }

  filter: rollup_and_call_dates {
    type: date
    sql:
{% condition rollup_and_call_dates %} ${daily_rollup.activity_date} {% endcondition %}
AND
{% condition rollup_and_call_dates %} ${frustrated_calls.date_pst_date} {% endcondition %}
    ;;
  }
}
