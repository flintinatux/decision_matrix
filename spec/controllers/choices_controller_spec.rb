require 'spec_helper'

describe ChoicesController do
  let(:decision) { FactoryGirl.create :decision }

  context "with some existing choices" do
    let!(:choices) { 2.times.map { FactoryGirl.create :choice, decision: decision } }
    describe 'GET #index' do
      before { get :index, decision_id: decision }
      it "finds the choices ordered by created_at asc" do
        assigns(:choices).should eq choices
      end
    end
  end
end
