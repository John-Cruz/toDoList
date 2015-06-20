rails g scaffold Activity category:references name:string due_date:datetime description:text position:integer
rails g model Category name:string
rails g migration AddCompleteToActivities
rails g migration ChangePositionToPriority

TO-D0

  validations
    # activity should have a name
    # activity should have a due_date
    # activity should have a position
    # category should have a name
    # tests

  controller
    # tests

  styling
    # index page
      modal for new activity
      side list for completed tasks

  AJAX (only on the lists page)
    dragon drop
    activity complete

  javascript


















  README
