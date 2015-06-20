class Activity < ActiveRecord::Base
  belongs_to :category

  validates :name, presence: true

  validates :due_date, format: {with: /\d{4}-\d\d-\d\d \d\d:\d\d:\d\d/}

  validates :priority, presence: true, numericality: true

  validates :priority, numericality: { only_integer: true }

  default_scope { order("priority ASC") }

end
