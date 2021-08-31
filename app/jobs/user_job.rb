class UserJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    #WelcomeMailer.intro().deliver
    Student.find(1)
  end
end
