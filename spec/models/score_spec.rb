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

require 'spec_helper'

describe Score do
  let(:score) { Score.new value: 5 }
  subject { score }

  it { should respond_to :value }
  it { should respond_to :choice }
  it { should respond_to :criterion }
  it { should be_valid }

  context "when value is less than 1" do
    before { subject.value = 0 }
    it "isn't valid" do
      subject.should_not be_valid
    end
  end

  context "when value is greater than 10" do
    before { subject.value = 11 }
    it "isn't valid" do
      subject.should_not be_valid
    end
  end

  it "defaults the value to 0" do
    Score.new.value.should eq 0
  end
end
