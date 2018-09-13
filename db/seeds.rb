 require 'random_data'
 
  # Create Topics
 5.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

 10.times do
   Post.create!(
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 25.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 10.times do
   Question.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     resolved: false
   )
 end
 questions = Question.all

 25.times do
   Answer.create!(
     question: questions.sample,
     body: RandomData.random_paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Question.count} questions created"
 puts "#{Answer.count} answers created"
 puts "#{Topic.count} topics created"