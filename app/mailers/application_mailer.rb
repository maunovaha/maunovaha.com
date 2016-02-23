class ApplicationMailer < ActionMailer::Base
  include ApplicationHelper

  default from: "noreply@maunovaha.com"
  layout "mailers/mailer"
end
