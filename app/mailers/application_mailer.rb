class ApplicationMailer < ActionMailer::Base
  include ApplicationHelper

  default from: "maunovaha.com <blog@maunovaha.com>"
  layout "mailers/mailer"
end
