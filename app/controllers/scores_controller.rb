class ScoresController < ApplicationController
  before_filter :fetch_decision
  before_filter :fetch_choice

  def index
    unless @choice
      redirect_to decision_choice_scores_path(@decision, @decision.choices.first) and return
    end
    fetch_scores
  end

  def create
    @updated = @choice.update_attributes params[:choice]
  end

  private

    def fetch_choice
      @choice = Choice.find_by_id params[:choice_id]
    end

    def fetch_decision
      @decision = Decision.find_by_id params[:decision_id]
    end

    def fetch_scores
      @scores = @choice.scores.includes(:criterion)
      @decision.criteria.each do |criterion|
        unless @scores.find{ |score| score.criterion == criterion }
          @scores << @choice.scores.build(criterion: criterion)
        end
      end
    end
end
