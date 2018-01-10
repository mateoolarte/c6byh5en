class Api::V1::ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token  

  def index
    render json: Product.all
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      render status: 201, json: { product: Product.all } 
    else
      render status: 422, json: { errors: @product.errors.full_messages }
    end
  end

  private
  def products_params
    params.permit(:name, :price)
  end
end  