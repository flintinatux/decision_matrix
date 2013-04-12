# == Schema Information
#
# Table name: decisions
#
#  id         :integer          not null, primary key
#  question   :string(255)
#  notes      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Decision < ActiveRecord::Base
  attr_accessible :notes, :question
  has_many :criteria
  has_many :choices

  validates :question, presence: true

  default_scope order: 'created_at desc'
end
