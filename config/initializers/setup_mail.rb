if Rails.env.development? || Rails.env.production?
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
      address:        'smtp.mailgun.org',
      port:           587,
      authentication: :plain,
      user_name:      ENV['MAILGUN_USERNAME'],
      password:       ENV['MAILGUN_PASSWORD'],
      domain:         'app8ead1a6fc2ca46c5ab1f9738a62942a5.mailgun.org',
      enable_starttls_auto: true,
      content_type:   'text/html'
    }
end
# Makes debugging *way* easier.
ActionMailer::Base.raise_delivery_errors = true

# This interceptor just makes sure that local mail
# only emails you.
# http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails
# class DevelopmentMailInterceptor
#   def self.delivering_email(message)
#     message.to =  'youremail@website.com'
#     message.cc = nil
#     message.bcc = nil
#   end
# end
#
# # Locally, outgoing mail will be 'intercepted' by the
# # above DevelopmentMailInterceptor before going out
# if Rails.env.development?
#   ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
# end
