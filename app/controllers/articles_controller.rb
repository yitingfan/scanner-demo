require 'nmap/xml'
class ArticlesController < ApplicationController
	def new
	end

	def create

		@host=Host.create ip: params[:host].ip

		NmapWorker.perform_async(@host.id) 
		

		redirect_to "/articles/show/#{@host.created_at.to_s}"
	end
	
	
	def index
		#@hosts=Host.all
		@hosts=Host.select("ip,created_at").group("created_at,ip")

	end 	
	def show
		puts "****"
		puts "****"
		@time=params[:created_at]
		puts @time
		#@host = Host.find(:created_at=>params[:created_at])
		@host=Host.where("created_at='#{@time}'")
		@host.each do|i|
			puts i.ip
			puts i.port
		end	
	end	
end