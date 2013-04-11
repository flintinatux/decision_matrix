require 'spec_helper'

describe Choice do
  let(:choice) { Choice.new name: 'Name' }
  subject { choice }

  it { should respond_to :name }
  it { should respond_to :decision }
  it { should be_valid }

  context "when name is blank" do
    before { subject.name = ' ' }
    it "isn't valid" do
      subject.should_not be_valid
    end
  end
end
