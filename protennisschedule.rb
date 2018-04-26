#!/usr/bin/ruby

require 'net/http'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

datedpath = 'http://api.sportradar.us/tennis-t2/en/schedules//schedule.xml?api_key=93fzqcbz6pq29rr5k539dtnz'
datedpath.insert(48, ARGV[0])

uri = URI datedpath

puts "DATE: " + ARGV[0]
#Net::HTTP.get_print uri

response = Net::HTTP.get_response(uri)
#puts response.body

#@doc = Nokogiri::XML.parse(response.body)
@doc = Nokogiri::XML(response.body)
#puts @doc.class
#puts @doc.namespaces
@doc.remove_namespaces!
#puts @doc.xpath('//competitors')
count =1
se_count =  1
tour_count =  1
@doc.xpath('//competitors').each do
  |competitors_element|
  puts "\n#{count}:"
  puts competitors_element
  count =count+1
end
@doc.xpath('//tournament').each do
  |tournament_element|
  puts "\n#{tour_count}:"
  puts tournament_element
  tour_count = tour_count+1
end

