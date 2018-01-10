class Api::V1::ProductsController < ApplicationController
  protect_from_forgery with: :null_session 

  def index
    render json: Product.all
  end

  def create
    product = Product.new(products_params)
    if product.save
      render json: product, status: 201
    else
      render status: 422, json: { errors: product.errors.full_messages }
    end
  end

  def update
    product = Product.find(params[:id])
    if product.update(products_params)
      render json: product
    else
      render status: 422, json: { errors: product.errors.full_messages } 
    end   
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    head :no_content
  end

  private
  def products_params
    params.permit(:name, :price)
  end
end  