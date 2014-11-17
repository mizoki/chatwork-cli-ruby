require 'faraday'
require 'json'

BASE_URI='https://api.chatwork.com/v1/'
API_TOKEN=ENV['CHATWORK_API_TOKEN']

GET_ROOMS='rooms'

chatwork_connection = Faraday::Connection.new(url: BASE_URI) do |builder|
  builder.use Faraday::Request::UrlEncoded
  builder.use Faraday::Response::Middleware
  builder.use Faraday::Adapter::NetHttp
end

response = chatwork_connection.get do |request|
  request.url GET_ROOMS
  request.headers = {
    'X-ChatWorkToken' => API_TOKEN
  }
end

response.success? ? results = JSON.parse(response.body) : return

results.each do |result|
  puts result['name'] + ' : Unread [' + result['unread_num'].to_s + '] Mention [' + result['mention_num'].to_s + ']' unless result['unread_num'].zero?
end

