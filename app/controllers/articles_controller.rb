require 'nmap/xml'
class ArticlesController < ApplicationController
	def new
	end

	def create
		@host=params[:host]   
		puts @host
		NmapWorker.perform_async(params[:host])
	end

	#def show1
	#	puts "******"
	#end	
	
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
		@host=Host.where("created_at=#{@time}")
		@host.each do|i|
			puts i.ip
			puts i.port
		end	
	end	
end
