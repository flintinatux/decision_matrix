# == Schema Information
#
# Table name: criteria
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  weight      :integer
#  decision_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Criterion < ActiveRecord::Base
  attr_accessible :name, :weight
  belongs_to :decision
  has_many :scores, dependent: :destroy
  has_many :choices, through: :scores

  after_initialize :set_defaults

  validates :name, presence: true
  validates :weight, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  default_scope order: 'created_at asc'

  def <=>(other)
    self.created_at <=> other.created_at
  end

  private

    def set_defaults
      self.weight ||= 0
    end
end
