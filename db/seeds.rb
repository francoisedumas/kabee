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
Feedback.create!(title: "My feedback", description: "This first feedback will be displayed soon", rating: 0, user: user)
Feedback.create!(title: "My second feedback", description: "This second feedback will follow", rating: 0, user: user)
Feedback.create!(title: "1 last thing", description: "More to come...", rating: 1, user: user)
# Feedback created
puts "Feedbacks created"