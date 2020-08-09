class DetailsController < ApplicationController
  before_action :set_detail, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :set_want, only: [:new, :create, :show, :update]
  
  def new
    @detail = Detail.new
  end

  def create
    @detail = Detail.new(detail_params)
    if @detail.save
      redirect_to want_detail_path(@want, @detail)
    else
      render action: :new
    end
  end

  def show
    @like = Like.new
  end

  def edit
  end

  def update
    if @detail.update_attributes(detail_params)
      redirect_to want_detail_path(@want, @detail)
    else
      render action: :edit
    end
  end

  def destroy
    @detail.destroy
    redirect_to wants_path
  end

  def sort
    detail = Detail.find(params[:detail_id])
    detail.update(sort_params)
    render body: nil
  end

  private
  def detail_params
    params.require(:detail).permit(:title, :memo, :want_id, :row_order_position, :youtube_url).merge(user: current_user)
  end

  def sort_params
    params.require(:detail).permit(:row_order_position)
  end

  def set_detail
    @detail = Detail.find(params[:id])
  end

  def set_user
    if @detail.user != current_user
      redirect_to wants_path
    end
  end

  def set_want
    @want = Want.find(params[:want_id])
  end

end
