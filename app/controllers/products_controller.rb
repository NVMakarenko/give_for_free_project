# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :find_product, except: %i[index new create show_offers]
  before_action :humanize_param, include: [:new, :edit]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.offers.build(product_params)
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

  def show_offers
    @products = current_user.offers
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
