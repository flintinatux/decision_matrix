class CriteriaController < ApplicationController
  before_filter :fetch_decision
  before_filter :fetch_criterion, only: [:edit, :update, :destroy]

  def index
    @criteria = @decision.criteria
  end

  def new
    @criterion = @decision.criteria.build
  end

  def create
    @criterion = @decision.criteria.build params[:criterion]
    @saved = @criterion.save
  end

  def edit
  end

  def update
    @updated = @criterion.update_attributes params[:criterion]
  end

  def destroy
    @criterion.destroy
  end

  private

    def fetch_criterion
      @criterion = Criterion.find params[:id]
    end

    def fetch_decision
      @decision = Decision.find params[:decision_id]
    end
end
