class UserRemainder
  include Delayed::RecurringJob
  run_every 1.day
  run_at '12:00am'
  timezone 'US/Pacific'
  queue 'user remainder'

  def perform
    start_interval, end_interval = [3.day, 1.day].map{|time| DateTime.now.ago(time).at_midnight.change(offset: 0)}
    users = User.select("name, email").
      where(last_sign_in_at: [start_interval..end_interval, start_interval - 2.days..end_interval - 3.days])
    UserMailer.notification(users).deliver_now
  end
end
