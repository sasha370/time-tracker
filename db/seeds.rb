40.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user: User.last)
end

puts " 40 Posts was created"