def random_time_between start_time, end_time
  Time.at((end_time.to_f - start_time.to_f) * rand + start_time.to_f)
end

users = []
10.times do |num|
  users << User.create!(psid: num, name: "Sample User #{num}")
end
puts 'Users created...'

100.times do |num|
  users.sample.todos.create!(item: "todo #{num}", created_at: random_time_between(4.years.ago, Time.now) )
end
puts 'Todos created...'

puts 'Seeds successful!'

