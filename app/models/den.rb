class Den < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :name, :presence => true
  validates :description, :presence => true

  belongs_to :user

  validates :name, uniqueness: { :scope => :user_id }

end
