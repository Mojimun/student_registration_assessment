class UserMailer < Devise::Mailer
    default from: 'mojimunislam@gmail.com.com' # Set the sender email address
  
    def welcome_email(user)
      @user = user
      @url = 'http://example.com/login' # Set the login URL
      mail(to: @user.email, subject: 'Welcome to My App')
    end
    def send_mail(user_email, subject, message)
        mail(to: user_email, body: message, subject: subject, content_type: "text/html")
    end
end
  