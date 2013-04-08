require 'spec_helper'

describe Decision do
  let(:decision) { Decision.new title: 'Title', notes: 'Notes' }
  subject { decision }

  it { should respond_to :title }
  it { should respond_to :notes }
  it { should be_valid }

  context "when title is blank" do
    before { subject.title = ' ' }
    it "is invalid" do
      subject.should_not be_valid
    end
  end
end
