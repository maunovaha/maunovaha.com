class SubscriberMailer < ApplicationMailer
  
  def confirmation_email(opts)
    @activation_url = activation_url(opts) 
    @banner_url     = banner_url

    mail(
      to: opts[:email],
      subject: "Verify your subscription",
      template_path: "subscribers/mailers",
      template_name: "confirmation_mailer"
    )
  end

  private

  def activation_url(opts)
    "#{base_url}/subscribers/#{opts[:id]}?email=#{opts[:email]}&token=#{opts[:token]}"
  end
end
