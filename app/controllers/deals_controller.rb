class DealsController < ApplicationController
  def index
    @deals = Deal.all
    respond_to do |format|
      format.html
      format.json { render json: @deals }
    end
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
