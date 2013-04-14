class DecisionsController < ApplicationController
  before_filter :fetch_decision, only: [:show, :edit, :update, :destroy, :decide]

  def index
    @decisions = Decision.paginate page: params[:page], per_page: 6
  end

  def show
  end

  def new
    @decision = Decision.new
  end

  def create
    @decision = Decision.new params[:decision]
    @saved = @decision.save
  end

  def edit
  end

  def update
    @updated = @decision.update_attributes params[:decision]
  end

  def destroy
  end

  def decide
    @choices = @decision.choices.sort_by(&:total_score).reverse
  end

  private

    def fetch_decision
      @decision = Decision.find_by_id params[:id]
    end
end
