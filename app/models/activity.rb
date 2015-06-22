class Activity < ActiveRecord::Base
  belongs_to :user, inverse_of: :activities

  belongs_to :category, inverse_of: :activities

  validates :user_id, presence: true

  validates :name, presence: true

  validates :priority, presence: true, numericality: { only_integer: true }

  default_scope { order("priority ASC") }

end
