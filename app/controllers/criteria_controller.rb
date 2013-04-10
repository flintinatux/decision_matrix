class CriteriaController < ApplicationController
  before_filter :fetch_decision
  before_filter :fetch_criterion, only: [:edit, :update, :delete]

  def index
    @criteria = @decision.criteria.paginate page: params[:page], per_page: 5
  end

  def new
    @criterion = @decision.criteria.build
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

    def fetch_criterion
      @criterion = Criterion.find params[:id]
    end

    def fetch_decision
      @decision = Decision.find params[:decision_id]
    end
end
