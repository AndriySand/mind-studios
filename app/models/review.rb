class Review < ActiveRecord::Base
  belongs_to :user
  validates :rate, :user_id, presence: true
end
