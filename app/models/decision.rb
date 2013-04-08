class Decision < ActiveRecord::Base
  attr_accessible :notes, :title

  validates :title, presence: true

  default_scope order: 'created_at desc'
end
