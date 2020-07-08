class ListController < ApplicationController
  before_action :set_list, only: [:edit, :update]
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
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to :root
    else
      render action :edit
    end
  end

  private
  def list_params
    params.require(:list).permit(:title).merge(user: current_user)
  end

  def set_list
    @list = List.find(params[:id])
  end
end