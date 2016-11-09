class Pub < ApplicationRecord
  has_many :reviews

  def average
    self.reviews.sum(:stars) / (self.reviews.any? ? self.reviews.count : 1)
  end
end
