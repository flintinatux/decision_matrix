class Decision < ActiveRecord::Base
  attr_accessible :notes, :question
  has_many :criteria
  has_many :choices

  validates :question, presence: true

  default_scope order: 'created_at desc'
end
