rails g scaffold Activity category:references name:string due_date:datetime description:text position:integer
rails g model Category name:string
rails g migration AddCompleteToActivities

TO-D0

  validations
    # activity should have a name
    # activity should have a due_date
    # activity should have a position
    # category should have a name
    # tests

  controller
    tests

  styling index page

  AJAX
    dragon drop
    activity complete

  javascript


















  README
