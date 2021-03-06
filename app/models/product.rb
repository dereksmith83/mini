class Product < ApplicationRecord
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0.00 }
  validates :name, presence: true
#  validates :name, uniqueness: true
  validates :description, length: { in: 3..500 }

  has_many :images
#  def images
#    Image.where(product_id: id)
#  end
  has_many :carted_products
  has_many :orders, through: :carted_products

  has_many :users, through: :carted_products

  has_many :category_products
  has_many :categories, through: :category_products

  belongs_to :supplier
#  def supplier
#    Supplier.find_by(id: supplier_id)
#  end

  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end
  def tax
    price * 0.09
  end
  def total
    price + tax
  end
  #def image_url_list
  #end
end