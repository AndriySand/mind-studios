class GoodCustomers
  include Delayed::RecurringJob
  run_every 7.days
  run_at '12:00am'
  timezone 'US/Pacific'
  queue 'good customers'

  def perform
    winners_rates = User.select("users.id, users.name, users.email, sum(reviews.rate) as rate").
      where('reviews.created_at > ?', 1.week.ago).joins(:reviews).group("id").having("sum(reviews.rate) > ?", 80)
    UserMailer.good_customers(winners_rates).deliver_now
  end
end
