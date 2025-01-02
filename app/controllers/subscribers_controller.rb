class SubscribersController < ApplicationController
  before_action :set_product

  def create
    @product.subscribers.find_or_create_by(subscriber_params)
    redirect_to @product, notice: "You are now subscribed."
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end