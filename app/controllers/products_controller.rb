# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :find_product, except: %i[index new create]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    humanize_param
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def humanize_param
    @deliveries = Product.deliveries.keys.collect { |k| [k.humanize, k] }
    @states = Product.states.keys.collect { |k| [k.humanize, k] }
  end

  def product_params
    params.require(:product).permit(:title, :about, :delivery, :state, :image)
  end
end
