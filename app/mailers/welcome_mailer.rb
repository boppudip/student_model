class WelcomeMailer < ApplicationMailer
    default from: 'abc@gmail.com'
    CONTACT_EMAIL = 'def@gmail.com'
    def intro(name)
       @name = name
       mail(to: CONTACT_EMAIL, subject: 'New registration page submission')
    end
end
