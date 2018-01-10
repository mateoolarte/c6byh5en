class Api::V1::ProductsController < ApplicationController

  def index
    render json: Product.all
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      render json: Product.all
    else
      render :json => { :errors => @product.errors.full_messages }
    end
  end

  private
  def products_params
    params.permit(:name, :price)
  end
end  