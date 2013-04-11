class Choice < ActiveRecord::Base
  attr_accessible :decision_id, :name
  belongs_to :decision

  validates :name, presence: true
  
  default_scope order: 'created_at asc'
end
