class ApplicationMailer < ActionMailer::Base
  default from: 'no_reply@time-tracker-hq.herokuapp.com'
  layout 'mailer'
end
