class Activity < ActiveRecord::Base
  belongs_to :category

  validates :name, presence: true

  validates :due_date, format: {with: /\d{4}-\d\d-\d\d \d\d:\d\d:\d\d/}

  validates :position, presence: true, numericality: true

  validates :position, numericality: { only_integer: true }

  default_scope { order("position ASC") }

end
