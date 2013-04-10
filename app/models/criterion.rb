class Criterion < ActiveRecord::Base
  attr_accessible :name, :weight
  belongs_to :decision

  validates :name, presence: true
  validates :weight, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
end