module Api
  module V1
    module Products
      class ProductsController < ApplicationController
        def index
          @products = Product.all
          render json: @products
        end
      end  
    end  
  end  
end