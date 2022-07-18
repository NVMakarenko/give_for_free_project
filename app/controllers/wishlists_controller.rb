# frozen_string_literal: true

class WishlistsController < ApplicationController
  before_action :find_wishlist, except: %i[index create]

  def index
    @wishes = current_user.wishes.includes(:owner)
  end

  def create
    @wishlist = current_user.wishlists.build(wishlist_params)
    if @wishlist.save!
      redirect_to wishlists_path
    else
      render root_path
    end
  end

  def destroy
    if @wishlist.delete
      redirect_to wishlists_path
    else
      render root_path
    end
  end

  private

  def find_wishlist
    @wishlist = Wishlist.find(params[:id])
  end

  def wishlist_params
    params.permit(:product_id)
  end
end
