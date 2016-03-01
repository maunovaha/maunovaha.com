namespace :blog do
  desc "Sends an email notification about given blog post for the users, " \
       "invoke with: rake blog:publish post=yyyy/mm/dd/post-name"
  task publish: [:environment, :stats] do
    p "Executes sending of notification email"
    post = Blogger.instance.find_post_by_url!("/blog/#{ENV['post']}")

    if post.published
      p "Post seems to be valid as published: true is in place."
      Subscriber.where(active: true).each do |subscriber|
        NotificationMailer.notification_email(subscriber.mailer_opts, post.mailer_opts).deliver_later
      end
    else
      p "Cancelled email notification, it appears that post with url: #{post.url} " \
        "has published: false. Change it to true before trying again."
    end
  end

  desc "Displays details about current blog subscribers"
  task stats: :environment do
    p "There is currently #{Subscriber.where(active: true).count} out of " \
      "#{Subscriber.count} subscribers active."
  end
end