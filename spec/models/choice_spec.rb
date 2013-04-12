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

require 'spec_helper'

describe Choice do
  let(:choice) { Choice.new name: 'Name' }
  subject { choice }

  it { should respond_to :name }
  it { should respond_to :decision }
  it { should respond_to :scores }
  it { should respond_to :criteria }
  it { should be_valid }

  context "when name is blank" do
    before { subject.name = ' ' }
    it "isn't valid" do
      subject.should_not be_valid
    end
  end
end
