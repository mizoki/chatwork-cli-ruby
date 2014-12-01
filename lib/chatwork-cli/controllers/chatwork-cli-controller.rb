require 'json'
require_relative '../models/chatwork-cli'

class ChatworkCliController
  def initialize(token = ENV['CHATWORK_API_TOKEN'])
    @chatwork = ChatworkCli.new(token)
  end

  def get_unread_rooms
    response = @chatwork.get_rooms
    unless response.nil?
      response.success? ? results = JSON.parse(response.body) : nil
      results.reject! { |res| res['unread_num'].zero? }
      results
    else
      []
    end
  end

  def get_room_ids
    response = @chatwork.get_rooms
    unless response.nil?
      response.success? ? results = JSON.parse(response.body) : nil
      results
    end
  end

  def get_messages(room_id)
    response = @chatwork.get_rooms_messages(room_id)
    unless response.nil?
      response.success? ? results = JSON.parse(response.body) : nil
      results.reject! { |res|
        res['body'] == '[deleted]'
      }
      results
    end
  end
end
