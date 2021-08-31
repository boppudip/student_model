class HardWorker
  include Sidekiq::Worker

  def perform(name)
    #Student.find(1)
    WelcomeMailer.intro(name).deliver
  end
end
