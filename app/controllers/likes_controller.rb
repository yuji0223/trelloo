class LikesController < ApplicationController
  before_action :set_detail
  before_action :set_want, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, detail_id: @detail.id)
    redirect_to want_detail_path(@want, @detail)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, detail_id: @detail.id)
    @like.destroy
    redirect_to want_detail_path(@want, @detail)
  end

  private

  def set_detail
    @detail = Detail.find(params[:detail_id])
  end

  def set_want
    @want = Want.find(params[:want_id])
  end
end
