class NotificationMailer < ApplicationMailer
  
  def notification_email(subscriber_opts, post_opts)
    @subscriber_opts  = subscriber_opts
    @post_opts        = post_opts
    @banner_url       = banner_url
    @unsubsribe_url   = unsubsribe_url(subscriber_opts)

    mail(
      to: @subscriber_opts[:email],
      subject: "Latest post: #{@post_opts[:title]}",
      template_path: "subscribers/mailers",
      template_name: "notification_mailer"
    )
  end

  def unsubsribe_url(opts)
    "#{base_url}/subscribers/#{opts[:id]}/cancellation?email=#{opts[:email]}&token=#{opts[:token]}"
  end

  def banner_url
    "#{base_url}#{view_context.image_path("email-banner.png")}"
  end
end