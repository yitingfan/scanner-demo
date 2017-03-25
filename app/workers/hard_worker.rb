class HardWorker
  include Sidekiq::Worker
  def perform(name, count)
    puts 'Hello ' + name
    # PhantomJS（Ruby -> phantomjs）
  end
end