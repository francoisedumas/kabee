# Cleaning DB
puts "Cleaning Database"
Feedback.destroy_all
User.destroy_all
# Creating a user
puts "Creating a User"
User.create!(first_name: "francois", last_name: "dumas", email: "dumas@lewagon.com",  password: "azerty")
# User created
puts "User created"
user = User.first
# Creating feedbacks
puts "Creating feedbacks"
Feedback.create!(title: "My feedback", user: user)
Feedback.create!(title: "My second feedback", user: user)
# Feedback created
puts "Feedbacks created"