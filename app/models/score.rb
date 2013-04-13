# == Schema Information
#
# Table name: scores
#
#  id           :integer          not null, primary key
#  value        :integer
#  choice_id    :integer
#  criterion_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Score < ActiveRecord::Base
  attr_accessible :value, :criterion, :criterion_id
  belongs_to :choice
  belongs_to :criterion

  after_initialize :set_defaults

  validates :value, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }

  def <=>(other)
    self.criterion <=> other.criterion
  end

  private

    def set_defaults
      self.value ||= 0
    end
end
