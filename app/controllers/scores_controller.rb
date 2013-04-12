class ScoresController < ApplicationController
  before_filter :fetch_decision
  before_filter :fetch_choice

  def index
    unless @choice
      redirect_to decision_choice_scores_path(@decision, @decision.choices.first) and return
    end
    fetch_scores
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
      @scores = load_new_scores unless @scores.any?
    end

    def load_new_scores
      @decision.criteria.map do |criterion|
        @choice.scores.build criterion: criterion
      end
    end

    def next_page
      choices = @decision.choices
      next_choice = choices.index(@choice) + 1
      if next_choice >= choices.length
        decision_path @decision 
      else
        decision_choice_scores_path @decision, choices[next_choice]
      end
    end
end
