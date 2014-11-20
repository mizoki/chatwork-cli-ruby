require_relative './chatwork-cli-controller'

chatwork = ChatworkCliController.new
results = chatwork.get_unread_rooms

results.each do |result|
  puts result['name'] + ' : Unread [' + result['unread_num'].to_s + '] Mention [' + result['mention_num'].to_s + ']'
end
