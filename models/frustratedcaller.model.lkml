connection: "elt_connector"

include: "*.view"

explore:  frustrated_calls{}
explore: daily_rollup {}

datagroup: frustratedcaller_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: frustratedcaller_default_datagroup
