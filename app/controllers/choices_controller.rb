class ChoicesController < ApplicationController
  before_filter :fetch_decision
  before_filter :fetch_choice, only: [:edit, :update, :destroy]

  def index
    @choices = @decision.choices
  end

  def new
    @choice = @decision.choices.build
  end

  def create
    @choice = @decision.choices.build params[:choice]
    @saved = @choice.save
  end

  def edit
  end

  def update
    @updated = @choice.update_attributes params[:choice]
  end

  def destroy
    @choice.destroy
  end

  private

    def fetch_choice
      @choice = Choice.find_by_id params[:id]
    end

    def fetch_decision
      @decision = Decision.find_by_id params[:decision_id]
    end
end
