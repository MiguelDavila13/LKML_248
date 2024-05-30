view: orders {
  sql_table_name: thelook.orders ;;
  #sql_table_name:
  #% if selection._parameter_value == "orders" %}
  #  thelook.orders
  #{% elsif selection._parameter_value == "items" %}
  #  thelook.order_items
  #{% else %}
  #  thelook.users
  #{% endif %} ;;

  drill_fields: [id]

  parameter: selection {
    type: unquoted
    allowed_value: {
      label: "Orders"
      value: "orders"
    }
    allowed_value: {
      label: "Items"
      value: "items"
    }
    allowed_value: {
      label: "Users"
      value: "users"
    }
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
  }
}
