class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :validatable, :trackable
  validates :name, presence: true, length: {minimum: 4}
  has_many :reviews, dependent: :destroy

end
