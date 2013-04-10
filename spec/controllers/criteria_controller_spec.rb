require 'spec_helper'

describe CriteriaController do

  context "with some existing criteria" do
    let(:decision) { FactoryGirl.create :decision }
    let(:criteria) { 2.times.map { FactoryGirl.create(:criterion, decision_id: decision.id) } }

    describe 'GET #index' do
      before { get :index, decision_id: decision.id }
      it "finds the criteria ordered by created_at asc" do
        assigns(:criteria).should eq criteria
      end
    end
  end
end
