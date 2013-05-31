require 'faker'

10.times do 
  List.create!(name: Faker::Lorem.word)
end

50.times do
  Task.create!(name: Faker::Lorem.sentence, list_id: rand(1..10))
end  
