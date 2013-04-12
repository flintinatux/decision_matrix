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

  describe 'POST #create' do
    context "with valid attributes" do
      it "creates a new choice" do
        expect do
          post :create, format: :js, decision_id: decision, choice: FactoryGirl.attributes_for(:choice)
        end.to change(Choice, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "doesn't create a new choice" do
        expect do
          post :create, format: :js, decision_id: decision, choice: {}
        end.to_not change(Choice, :count)
      end
    end
  end

  context "with an existing choice" do
    let(:choice) { FactoryGirl.create :choice }

    shared_examples "a choice finder" do
      it "finds the correct choice" do
        assigns(:choice).should eq choice
      end
    end

    describe 'GET #edit' do
      before { get :edit, decision_id: decision, id: choice }
      it_should_behave_like "a choice finder"
    end

    describe 'PUT #update' do
      let(:new_name) { 'New name' }
      before do
        put :update, format: :js, decision_id: decision, id: choice, choice: FactoryGirl.attributes_for(:choice).merge(name: new_name)
      end
      it_should_behave_like "a choice finder"

      it "updates the choice" do
        Choice.find(choice.id).name.should eq new_name
      end
    end
  end
end
