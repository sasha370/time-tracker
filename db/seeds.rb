
AdminUser.create!(email: 'admin@admin.ru', password: '123456', first_name: 'Admin', last_name: 'First')
puts 'Admin user was created'

40.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user: User.first)
end

puts " 40 Posts was created"