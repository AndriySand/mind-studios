class UserMailer < ApplicationMailer

  def notification(user)
    @user = user
    @url  = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Visit our site, please')
  end

  def weekly_winners(winners_rates)
    @winners_rates = winners_rates
    User.all.each do |user|
      @user = user
      mail(to: @user.email, subject: 'Look at our TOP 10!')
    end
  end

  def good_customers(winners_rates)
    winners_rates.each do |winner_rate|
      @user_name = winner_rate.name
      @rate = winner_rate.rate
      mail(to: winner_rate.email, subject: 'Congratulations!')
    end
  end
end
