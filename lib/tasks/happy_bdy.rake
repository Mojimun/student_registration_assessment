require 'date'
desc "send happy birthday"
task happy_bdy: [:environment] do
    all_mail = User.all
    recipients = all_mail.map{|x| {email: x.email, dob: x.dob}}
    subject = "Wish Birthday!!"
    message = "happy Birthday"
    recipients_arr = []
    recipients.each do |user|
        current_date = Time.now.strftime("%Y-%m-%d")
        current_date = Date.parse(current_date)
        user_dob = user[:dob]
         
        recipients_arr << user[:email] if user_dob.strftime("%m-%d") == current_date.strftime("%m-%d")
    end
    UserMailer.send_mail(recipients_arr, subject, message).deliver
end