40.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user: User.first)
end

puts " 40 Posts was created"