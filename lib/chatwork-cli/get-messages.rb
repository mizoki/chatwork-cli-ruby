require_relative './controllers/chatwork-cli-controller'

chatwork = ChatworkCliController.new
rooms = chatwork.get_room_ids

rooms.each_with_index do |room, i|
  puts sprintf('%02d: %s', i+1, room['name'])
end

input_id = gets

rooms.each_with_index do |room, i|
  if (i+1) == input_id.to_i
    puts room['name']
    @results = chatwork.get_messages room['room_id']
  end
end

puts '----------------------------------------------------------------------'

@results.each_with_index do |res, i|
  puts res['account']['name'] + ' [ ' + Time.at(res['send_time']).strftime('%Y/%m/%d %H:%M') + ' ]'
  res['body'].split('\n').each do |line|
    puts line
  end
  puts '----------------------------------------------------------------------'
end
