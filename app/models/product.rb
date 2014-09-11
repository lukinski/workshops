class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates_presence_of :description, :title, :price
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

  def average_rating
    reviews.map { |x| x["rating"].to_f }.inject(:+) / reviews.length
  end
end
