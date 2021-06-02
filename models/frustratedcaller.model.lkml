connection: "elt_connector"

include: "*.view"

explore: daily_rollup {
  hidden: yes
    join: frustrated_calls {
      relationship: many_to_many
      type: left_outer
      sql_on: ${daily_rollup.company_id} = ${frustrated_calls.company_id}  ;;
  }
    join: link {
      relationship: one_to_one
      type: left_outer
      sql_on: ${daily_rollup.company_id} = ${link.PRL_COMPANY_ID_C}  ;;
  }
}
datagroup: frustratedcaller_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: frustratedcaller_default_datagroup
