require 'faker'
 
 # Create Posts
 1.times do
   postTest = Post.find_by title: 'Unique Title'
   if postTest.nil?
     Post.create!(
       title:  "Unique Title",
       body:   Faker::Lorem.paragraph
     )
   end
 end
 posts = Post.all
 
 # Create Comments
 1.times do
   commentTest = Comment.find_by body: 'Unique Comment'
   if commentTest.nil?
   Comment.create!(
     post: posts.sample,
     body: "Unique Comment"
   )
   end
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"