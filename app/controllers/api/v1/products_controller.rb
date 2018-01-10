class Api::V1::ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token  

  def index
    render json: Product.all
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      render json: { status: 201, product: Product.all } 
    else
      render json: { status: 422, errors: @product.errors.full_messages }
    end
  end

  private
  def products_params
    params.permit(:name, :price)
  end
end  