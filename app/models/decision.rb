class Decision < ActiveRecord::Base
  attr_accessible :notes, :question

  validates :question, presence: true

  default_scope order: 'created_at desc'
end
