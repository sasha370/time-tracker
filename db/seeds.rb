AdminUser.create!(
    email: 'admin@admin.ru',
    password: '123456',
    first_name: 'Admin',
    last_name: 'First',
    phone: "+12096006734")
User.create!(
    email: 'test@test.ru',
    password: '123456',
    first_name: 'Test',
    last_name: 'User',
    phone: "+19999999999")

10.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user: AdminUser.first, overtime_request: 2.5)
end

5.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user: User.last, overtime_request: 1.5)
end

5.times do |post|
  AuditLog.create!(user_id: User.first.id, status: 0, start_date: (Date.today - 6.days))
end

puts 'Admin user was created'
puts 'User user was created'
puts "Posts was created"