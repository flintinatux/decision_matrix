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

require 'spec_helper'

describe Criterion do
  let(:criterion) { Criterion.new name: 'Name', weight: 5 }
  subject { criterion }

  it { should respond_to :name }
  it { should respond_to :weight }
  it { should respond_to :decision }
  it { should respond_to :scores }
  it { should respond_to :choices }
  it { should be_valid }

  shared_examples "an invalid criterion" do
    it "is not valid" do
      subject.should_not be_valid
    end
  end

  context "when name is blank" do
    before { subject.name = ' ' }
    it_should_behave_like "an invalid criterion"
  end

  context "when weight is not an integer" do
    before { subject.weight = 3.0 }
    it_should_behave_like "an invalid criterion"
  end

  context "when weight is less than 1" do
    before { subject.weight = 0 }
    it_should_behave_like "an invalid criterion"
  end

  context "when weight is greater than 10" do
    before { subject.weight = 11 }
    it_should_behave_like "an invalid criterion"
  end

  it "defaults the weight to 0" do
    Criterion.new.weight.should eq 0
  end
end
