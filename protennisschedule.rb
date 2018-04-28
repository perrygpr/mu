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

count =1
@doc.xpath('//competitors/player').each do
  |competitors_element|
  puts "\nSINGLES #{count}:"
  puts competitors_element
  count =count+1
end

count = 1
@doc.xpath('//competitors/double_team/player').each do
  |competitors_element|
  puts "\nDOUBLES #{count}:"
  puts competitors_element
  count =count+1
end

#@doc.xpath('//tournament').each do
#  |tournament_element|
#  puts "\n#{tour_count}:"
#  puts tournament_element.class
#  puts tournament_element.at_xpath("/*/*/*").name
#  puts tournament_element.at_xpath("/*/*/*")
#  puts tournament_element.at_xpath("/*/*/competitors/player")
#  tour_count = tour_count+1
#end
#puts @doc
