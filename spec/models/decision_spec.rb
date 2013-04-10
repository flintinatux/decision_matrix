require 'spec_helper'

describe Decision do
  let(:decision) { Decision.new question: 'Question', notes: 'Notes' }
  subject { decision }

  it { should respond_to :question }
  it { should respond_to :notes }
  it { should respond_to :criteria }
  # it { should respond_to :choices }
  it { should be_valid }

  context "when question is blank" do
    before { subject.question = ' ' }
    it "is invalid" do
      subject.should_not be_valid
    end
  end
end
