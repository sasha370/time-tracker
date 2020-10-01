100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user: User.last)
end

puts " 100 Posts was created"