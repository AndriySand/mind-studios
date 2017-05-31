class WeeklyWinners
  include Delayed::RecurringJob
  run_every 7.days
  run_at '12:00am'
  timezone 'US/Pacific'
  queue 'weekly winners'

  def perform
    winners_rates = User.select("users.id, users.name, sum(reviews.rate) as rate").joins(:reviews).group("id").order("rate desc").limit(10)
    UserMailer.weekly_winners(winners_rates).deliver_now
  end
end
