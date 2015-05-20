require 'net/https'
require 'json'
uri = URI('https://api.clever.com/v1.1/districts/4fd43cc56d11340000000005/sections')

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

request = Net::HTTP::Get.new(uri.request_uri)
request.add_field 'Authorization', 'Bearer DEMO_TOKEN'

response = http.request(request)

x = JSON.parse(response.body)["data"]

sum = 0.0

x.each do |section|
  sum += section["data"]["students"].count
end

puts sum / x.count
