require 'nmap/program'
require 'nmap/xml'
require 'optparse'
class NmapWorker
    include Sidekiq::Worker
    
    def perform(id)
        host = Host.find id
    Nmap::Program.scan do |nmap|
  
        nmap.connect_scan = true
        nmap.fast=true
        nmap.targets = host
        nmap.xml='scan.xml'
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


