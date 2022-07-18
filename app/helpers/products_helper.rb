# frozen_string_literal: true

module ProductsHelper
  def not_in_wishlist?(product, user)
    user.wishes.exclude?(product)
  end

  def wishlist_by_product(product, user)
    user.wishlists.find_by(product:)
  end
end
