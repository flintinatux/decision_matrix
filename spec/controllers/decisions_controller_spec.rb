require 'spec_helper'

describe DecisionsController do

  describe 'GET #index' do
    let!(:decisions) { 2.times.map { FactoryGirl.create :decision } }
    before { get :index }
    
    it "loads decisions ordered by created_at desc" do
      assigns(:decisions).should eq decisions.sort_by(&:created_at).reverse
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "creates a new decision" do
        expect do 
          post :create, format: :js, decision: FactoryGirl.attributes_for(:decision) 
        end.to change(Decision, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "creates a new decision" do
        expect do 
          post :create, format: :js, decision: {}
        end.to_not change(Decision, :count)
      end
    end
  end

  context "with an existing decision" do
    let!(:decision) { FactoryGirl.create :decision }

    shared_examples "a decision finder" do
      it "finds the right decision" do
        assigns(:decision).should eq decision
      end
    end

    describe 'GET #show' do
      before { get :show, id: decision.id }
      it_should_behave_like "a decision finder"
    end

    describe 'GET #edit' do
      before { get :edit, id: decision.id }
      it_should_behave_like "a decision finder"
    end

    describe 'PUT #update' do
      let(:new_question) { 'New question' }
      before do
        put :update, format: :js, id: decision.id, decision: FactoryGirl.attributes_for(:decision).merge(question: new_question)
      end
      it_should_behave_like "a decision finder"

      it "updates the decision" do
        Decision.find(decision.id).question.should eq new_question
      end
    end

    context "with choices and scores" do
      let!(:choices) { 3.times.map { FactoryGirl.create :choice, decision: decision } }
      let!(:criteria) { 3.times.map { FactoryGirl.create :criterion, decision: decision } }
      let!(:scores) do
        choices.map do |choice|
          criteria.map do |criterion|
            choice.scores.create criterion: criterion, value: choice.id
          end
        end.flatten
      end

      describe 'GET #decide' do
        before { get :decide, id: decision }
        it "finds choices ordered by total_score asc" do
          assigns(:choices).should eq choices.sort_by(&:total_score).reverse
        end
      end

      describe 'DELETE #destroy' do
        it "deletes the decision" do
          expect { delete :destroy, format: :js, id: decision }.to change(Decision, :count).by(-1)
        end

        describe 'deleting the decision' do
          before { delete :destroy, format: :js, id: decision }

          it "also deletes its choices" do
            Choice.where(decision_id: decision.id).should be_empty
          end

          it "also deletes its criteria" do
            Criterion.where(decision_id: decision.id).should be_empty
          end
        end
      end
    end
  end
end
