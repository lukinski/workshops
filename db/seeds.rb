users = []
products = []

(1..4).each do |n|
  users << User.create!(firstname: 'John', lastname: "Doe #{n}", email: "john#{n}@netguru.com", password: 'topsecret', password_confirmation: 'topsecret')
end

u = User.create!(firstname: 'System', lastname: 'Administrator', email: 'admin@netguru.com', password: 'admin_pass', password_confirmation: 'admin_pass')
u.admin = true
u.save
users << u

category = Category.create!(name: "Example Category")

(1..5).each do |n|
  products << Product.create!(title: "Product #{n}", description: "Sample description for Product no. #{n}", price: sprintf('%.2f', (rand * 50)), category: category, user: users.sample)
end

(1..20).each do |n|
  Review.create!(content: "Sample review no. #{n}", rating: ([*1..5]).sample, product: products.sample, user: users.sample)
end