# frozen_string_literal: true

class ProductDecorator < Draper::Decorator
  delegate_all

  def delivery
    deliveries.keys.collect { |k| [k.humanize, k] }
  end

  def state
    states.keys.collect { |k| [k.humanize, k] }
  end
end
