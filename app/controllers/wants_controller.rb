class WantsController < ApplicationController
  before_action :set_want, only: [:edit, :update, :destroy]
  
  def index
    @wants = Want.includes(:user)
  end
  
  def new
    @want = Want.new
  end

  def create
    @want = Want.new(want_params)
    if @want.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit
    if @want.user != current_user
      redirect_to action: :index
    end
  end

  def update
    if @want.update_attributes(want_params)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    @want.destroy
    redirect_to action: :index
  end

  private
  def want_params
    params.require(:want).permit(:title).merge(user: current_user)
  end

  def set_want
    @want = Want.find(params[:id])
  end

end
