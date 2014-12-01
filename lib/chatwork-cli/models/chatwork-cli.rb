require 'faraday'

class ChatworkCli

  BASE_URI='https://api.chatwork.com/v1/'

  GET_ROOMS='rooms'
  GET_ROOMS_MESSAGES='messages'

  def initialize(token)
    @api_token = token
    @connection = create_connection
  end

  def get_rooms
    get(GET_ROOMS)
  end

  def get_rooms_messages(room_id)
    request = GET_ROOMS + '/' + room_id.to_s + '/' + GET_ROOMS_MESSAGES + '?force=1'
    get(request)
  end

  private
  def create_connection
    Faraday::Connection.new(url: BASE_URI) do |builder|
      builder.use Faraday::Request::UrlEncoded
      builder.use Faraday::Response::Middleware
      builder.use Faraday::Adapter::NetHttp
    end
  end

  def get(request_url)
    @connection.get do |request|
      request.url request_url
      request.headers = {
        'X-ChatWorkToken' => @api_token
      }
    end
  end
end
