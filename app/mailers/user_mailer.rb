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

    def verified_unvarified_email(user)
        if (user.varified_by_admin == true)
            subject = "Congratulations! #{user.name} Your Account is Verified"
            message = "<p>Hi #{user.name},</p>
            <p>Congratulations! Your account with Student Registration application has been successfully verified.</p>
            <p>You can now log in and access all the features of our platform.</p>
            <p>Thank you for choosing Student Registration application!</p>
            <p>Best regards,</p>
            <p>The Student Registration Team</p>"
        else
            subject = "Account Deactivation Notification";
            message = "<p>Hi #{user.name},</p>
            <p>We regret to inform you that your account with Student Registration application has been deactivated.</p>
            <p>Your account did not meet the verification requirements, and as a result, it has been deactivated.</p>
            <p>If you believe this is a mistake or would like to appeal the deactivation, please contact our support team at mojimunislam@gmail.com.</p>
            <p>Thank you for considering Student Registration application, and we apologize for any inconvenience this may have caused.</p>
            <p>Best regards,</p>
            <p>The Student Registration Team</p>"
        end
        mail(to: user.email, body: message, subject: subject, content_type: "text/html")
    end
end
  