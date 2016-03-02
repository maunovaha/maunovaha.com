class ApplicationMailer < ActionMailer::Base
  include ApplicationHelper

  default from: "maunovaha.com <blog@maunovaha.com>"
  layout "mailers/mailer"

  def banner_url
    "#{base_url}#{view_context.image_path("email-banner.png")}"
  end
end
