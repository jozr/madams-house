class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :den

  validates :content, presence: true
  validates :user_id, presence: true
  validates :den_id, presence: true
  validates :rating, presence: true
end
