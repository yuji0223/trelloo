class CardController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def new
    @card = Card.new
    @list = List.find(params[:list_id])
  end

  def create
    @card = Card.new(card_params)
    @card.order = Card.where(list_id: params[:list_id]).maximum(:order).to_i + 1
    if @card.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def show
  end

  def edit
    @lists = List.where(user: current_user)
    @cards = Card.where(list_id: params[:list_id]).rank(:row_order)
  end

  def update
    # if params[:list_id] != card_params[:list_id]
    #   @card.order = Card.where(list_id: card_params[:list_id]).maximum(:order).to_i + 1
    # elsif @card.order != card_params[:order]
    #   order_after = card_params[:order].to_i
    #   if @card.order > order_after
    #     (order_after..@card.order-1).each {|n|
    #       @card_order = Card.find_by(list_id: params[:list_id], order: n)
    #       @card_order.update_attributes(order: n+1)
    #     }
    #   elsif @card.order < order_after
    #     (@card.order+1..order_after).each {|n| 
    #       @card_order = Card.find_by(list_id: params[:list_id], order: n)
    #       @card_order.update_attributes(order: n-1)
    #     }
    #   end
    #   @card.order = card_params[:order]
    # end

    if @card.update_attributes(card_params)
      redirect_to :root
    else
      render action: :edit
    end
  end

  def destroy
    cards = Card.where(list_id: params[:list_id], order: @card.order+1..Float::INFINITY)
    cards.each { |card|
      card.update_attributes(order: card.order-1)
    }
    @card.destroy
    redirect_to :root
  end

  def sort
    card = Card.find(params[:card_id])
    card.update(card_params)
    render body: nil
  end

  private
  def card_params
    params.require(:card).permit(:title, :memo, :list_id, :order, :row_order_position)
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
