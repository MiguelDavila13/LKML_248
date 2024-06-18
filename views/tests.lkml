test: name_is_not_null{
  explore_source: users {
    column: first_name {}
  }
  assert: name_is_not_null {
    expression: NOT is_null(${users.first_name});;
  }
}
