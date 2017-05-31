class UserRemainder
  include Delayed::RecurringJob
  run_every 1.day
  run_at '12:00am'
  timezone 'US/Pacific'
  queue 'user remainder'

  def perform
    User.all.each do |user|
      next unless user.sign_in_between?
      UserMailer.notification(user).deliver_now
    end
  end
end
