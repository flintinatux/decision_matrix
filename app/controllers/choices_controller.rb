class ChoicesController < ApplicationController
  before_filter :fetch_decision
  before_filter :fetch_choice, only: [:edit, :update, :destroy]

  def index
    @choices = @decision.choices.paginate page: params[:page], per_page: 5
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
  end

  private

    def fetch_choice
      @choice = Choice.find params[:id]
    end

    def fetch_decision
      @decision = Decision.find params[:decision_id]
    end
end
