class ApplicationMailer < ActionMailer::Base
  default to: "info@dndapp.com", from: "info@dndapp.com"
  layout 'mailer'
end
