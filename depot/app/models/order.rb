class Order < ActiveRecord::Base
  PAYMENT_TYPES = ["Boleto", "Crédito", "Débito"]
  validates :name, :address, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  has_many :line_items, dependent: :destroy

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil # desvincular do carrinho
      line_items << item
    end
  end
end
