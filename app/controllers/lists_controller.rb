class ListsController < ApplicationController
  before_action :set_list, only: [:edit, :update, :destroy]
  
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def edit
    if @list.user == current_user
      render action: :edit
    else
      redirect_to :root
    end
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to :root
    else
      render action: :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to :root
  end

  private
  def list_params
    params.require(:list).permit(:title).merge(user: current_user)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
