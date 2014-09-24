class Den < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :name, :presence => true
  validates :description, :presence => true
  validates :name, uniqueness: { :scope => :user_id }

  has_many :reviews
  belongs_to :user

  def average_rating
    sum = 0
    counter = 0
    self.reviews.each do |r|
      sum += r.rating
      counter += 1
    end
    average = sum / counter
    average
  end
end
