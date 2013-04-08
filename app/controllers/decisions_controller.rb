class DecisionsController < ApplicationController
  def index
    @decisions = Decision.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end
