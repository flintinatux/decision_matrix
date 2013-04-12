# == Schema Information
#
# Table name: choices
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  decision_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Choice < ActiveRecord::Base
  attr_accessible :name
  belongs_to :decision
  has_many :scores
  has_many :criteria, through: :scores

  validates :name, presence: true
  
  default_scope order: 'created_at asc'
end
