desc "daily good morning mail send"
task daily_mail_send: [:environment] do
    all_mail = User.all
    recipients = all_mail.map{|x| x.email}
    puts recipients
    subject = "Good Morning!"
    message = "Good Morning!"
    UserMailer.send_mail(recipients, subject, message).deliver
end