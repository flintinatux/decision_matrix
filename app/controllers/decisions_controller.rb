class DecisionsController < ApplicationController
  before_filter :fetch_decision, only: [:show, :edit, :update, :delete]

  def index
    @decisions = Decision.paginate page: params[:page], per_page: 5
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

  def delete
  end

  private

    def fetch_decision
      @decision = Decision.find params[:id]
    end
end
