require 'nmap/program'
require 'nmap/xml'
require 'optparse'
class NmapWorker
  include Sidekiq::Worker

  def perform(host)
    # Do something

	#options = {}
	#option_parser = OptionParser.new do |opts|
    #opts.banner = 'here is help messages of the command line tool.'
    #opts.on('-s', '--service', 'service scan') do
    #options[:service] = true
    #end
    #opts.on('-h HOST1,HOST2', '--host Host1,Host2', Array,'host scan') do |value|
    #options[:host] = value
    #end
    #end.parse!

    #@service= options[:service]
    #@host=options[:host]
    #host.each do |host|
    Nmap::Program.scan do |nmap|
    #if !@service.nil?
    #    nmap.service_scan=true
    #end
    nmap.connect_scan = true
    nmap.fast=true
    nmap.targets = host
    nmap.xml='scan.xml'
    #end
    end

    Nmap::XML.new('scan.xml') do |xml|
        xml.each_host do |host|
            puts "[#{host.ip}]"
            host.each_port do |port|
                puts " #{port.number}/#{port.protocol}\t#{port.state}\t#{port.service}"
                host=Host.create(:ip=>"#{host.ip}",:port=>"#{port.number}",:service=>"#{port.service}",:protocal=>"#{port.protocol}",:state=>"#{port.state}")
            end                                 
        end
    end




  end
end


#NmapWorker.new.perform('127.0.0.1')
