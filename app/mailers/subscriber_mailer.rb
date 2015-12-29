class SubscriberMailer < ApplicationMailer
  
  def confirmation_email(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber.email,
         subject: "Confirm your subscription",
         template_path: "subscribers/mailers",
         template_name: "confirmation_mailer")
  end
end
