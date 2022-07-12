# frozen_string_literal: true

module ProductsHelper
  def choose_delivery
    Product.deliveries.map { |k, v| [Product.human_attribute_name(k.to_s), v] }
  end

  def choose_state
    Product.states.map { |k, v| [Product.human_attribute_name(k.to_s), v] }
  end
end
