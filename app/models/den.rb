class Den < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :name, :presence => true
  validates :description, :presence => true
  validates :name, uniqueness: { :scope => :user_id }

  has_many :reviews
  belongs_to :user



end
