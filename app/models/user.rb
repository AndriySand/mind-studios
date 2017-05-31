class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :validatable, :trackable
  validates :name, presence: true, length: {minimum: 4}
  has_many :reviews, dependent: :destroy

  def sign_in_between?
    start_interval, end_interval = [3.day, 1.day].map{|time| DateTime.now.ago(time).at_midnight.change(offset: 0)}
    time_between?(start_interval, end_interval) ||
    time_between?(start_interval - 2.day, end_interval - 3.day)
  end

  def time_between?(start_interval, end_interval)
    last_sign_in_at.between?(start_interval, end_interval)
  end
end
