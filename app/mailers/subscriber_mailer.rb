class SubscriberMailer < ApplicationMailer
  
  def confirmation_email(subscriber)
    @activation_link = activation_link(subscriber) 

    mail(to: subscriber.email,
         subject: "Verify your subscription",
         template_path: "subscribers/mailers",
         template_name: "confirmation_mailer")
  end

  private

  def activation_link(subscriber)
    "http://#{Rails.env.production? ? 'maunovaha.com' : 'localhost:3000'}" \
    "/subscribers/#{subscriber.id}?email=#{subscriber.email}&token=#{subscriber.token}"
  end
end
