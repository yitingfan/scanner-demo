class HelloController < ApplicationController
  def index
  	HardWorker.perform_async('Tom', 5)
  end
end
