# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  has_many :line_items
  before_destroy :check_if_referenced_by_line_items

  validates :title, :description, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :title, uniqueness: true

  def self.latest
    Product.order(:updated_at).last
  end

  def to_s
    "Produto: #{title}, com o valor: #{price}"
  end

  def check_if_referenced_by_line_items
    if self.line_items.empty?
      true
    else
      errors.add(:base, 'Não pode apagar, pois tem itens relacionados.')
    end
  end
end
