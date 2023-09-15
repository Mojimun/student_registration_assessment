class UserMailer < Devise::Mailer
    default from: 'mojimunislam@gmail.com' # Set the sender email address
    
    def send_mail(user_email, subject, message)
        mail(to: user_email, body: message, subject: subject, content_type: "text/html")
    end

    def welcome_email(user, password)
        subject = "Welcome to Student Registration application"
        message = "<p>Hi #{user.name},</p>
        <p>You've successfully registered your account with Student Registration application.</p>
        <p>Your username/email: #{user.email}</p>
        <p>Temporary Password: #{password}</p>"
        mail(to: user.email, body: message, subject: subject, content_type: "text/html")
    end
end
  