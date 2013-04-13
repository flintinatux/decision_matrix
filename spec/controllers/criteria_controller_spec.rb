require 'spec_helper'

describe CriteriaController do
  let(:decision) { FactoryGirl.create :decision }

  context "with some existing criteria" do
    let!(:criteria) { 2.times.map { FactoryGirl.create(:criterion, decision_id: decision.id) } }

    describe 'GET #index' do
      before { get :index, decision_id: decision }
      it "finds the criteria ordered by created_at asc" do
        assigns(:criteria).should eq criteria
      end
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "creates a new criterion" do
        expect do 
          post :create, format: :js, decision_id: decision, criterion: FactoryGirl.attributes_for(:criterion)
        end.to change(Criterion, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "doesn't create a new criterion" do
        expect do
          post :create, format: :js, decision_id: decision, criterion: {}
        end.to_not change(Criterion, :count)
      end
    end
  end

  context "with an existing criterion" do
    let(:criterion) { FactoryGirl.create :criterion }

    shared_examples "a criterion finder" do
      it "finds the criterion" do
        assigns(:criterion).should eq criterion
      end
    end

    describe 'GET #edit' do
      before { get :edit, decision_id: decision, id: criterion }
      it_should_behave_like "a criterion finder"
    end

    describe 'PUT #update' do
      let(:new_name) { 'New name' }
      before do
        put :update, format: :js, decision_id: decision, id: criterion, criterion: FactoryGirl.attributes_for(:criterion).merge(name: new_name)
      end
      it_should_behave_like "a criterion finder"

      it "updates the criterion" do
        Criterion.find(criterion.id).name.should eq new_name
      end
    end
  end
end
