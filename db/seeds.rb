admin_user = AdminUser.create!(
    email: 'admin@admin.ru',
    password: '123456',
    first_name: 'Admin',
    last_name: 'First',
    phone: "12096006734",
    ssn: '1234',
    company: 'ABC Ltd')
user = Employee.create!(
    email: 'test@test.ru',
    password: '123456',
    first_name: 'Test',
    last_name: 'User',
    phone: "1999999999",
    ssn: '1234',
    company: 'ABC Ltd')

AuditLog.create!(user_id: user.id, status: 0, start_date: (Date.today - 6.days))
AuditLog.create!(user_id: user.id, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user_id: user.id, status: 0, start_date: (Date.today - 20.days))

25.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} Lorem ipsum dolor sit amet, consectetur adipisicing elit. Qui dicta minus molestiae vel beatae natus eveniet ratione temporibus aperiam harum alias officiis assumenda officia quibusdam deleniti eos cupiditate dolore doloribus!", user: Employee.last, daily_hours: 1.5)
end

puts 'Admin user was created'
puts 'User user was created'
puts "Posts was created"