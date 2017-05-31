class ApplicationMailer < ActionMailer::Base
  default from: "this_site@mail.com"
  layout 'mailer'
end
