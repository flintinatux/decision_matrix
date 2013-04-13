require 'spec_helper'

describe ScoresController do
  let!(:decision) { FactoryGirl.create :decision }
  let!(:choices)  { 3.times.map { FactoryGirl.create :choice, decision: decision } }
  let!(:criteria) { 3.times.map { FactoryGirl.create :criterion, decision: decision } }
  let(:choice)    { choices.first }
  let(:scores) do
    criteria.map do |criterion|
      choice.scores.create criterion: criterion, value: 5
    end.sort
  end

  subject { page }

  describe 'GET #index' do
    context "with choice_id not supplied" do
      before { get :index, decision_id: decision }
      it { should redirect_to decision_choice_scores_path(decision, choices.first) }

      it "doesn't find scores" do
        assigns(:scores).should_not be_present
      end
    end

    context "with choice_id supplied" do
      context "and no existing scores" do
        before { get :index, decision_id: decision, choice_id: choice }

        it "loads new (invalid) scores" do
          assigns(:scores).each { |score| score.should_not be_valid }
        end
        
        it "builds scores for that choice" do
          assigns(:scores).each { |score| score.choice.should eq choice }
        end
      end

      context "with existing scores" do
        before { scores }
        before { get :index, decision_id: decision, choice_id: choice }

        it "finds the correct scores" do
          assigns(:scores).should eq scores
        end
      end
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) do
      { scores_attributes: criteria.map do |criterion|
          FactoryGirl.attributes_for :score, choice: choice, criterion: criterion
        end }
    end
    let(:invalid_attributes) do
      { scores_attributes: criteria.map do |criterion|
          FactoryGirl.attributes_for :score, value: 0, choice: choice, criterion: criterion
        end }
    end

    context "with valid params" do
      it "creates new scores" do
        expect do 
          post :create, format: :js, decision_id: decision, choice_id: choice, choice: valid_attributes
        end.to change(Score, :count).by(3)
      end
    end

    context "with invalid params" do
      it "doesn't create any scores" do
        expect do 
          post :create, format: :js, decision_id: decision, choice_id: choice, choice: invalid_attributes
        end.to_not change(Score, :count)
      end
    end
  end
end
