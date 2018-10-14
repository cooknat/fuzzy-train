require 'rails_helper'
require 'random_data'

RSpec.describe PostsController, type: :request do
  
   let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
   let(:my_post) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }


  describe "GET #index" do
    it "returns http success" do
      get '/posts'
      expect(response.status).to eq 200
    end
    
     it "renders the index template" do
      get '/posts'
      expect(response).to render_template(:index)
    end
  end
  
  describe "GET show" do
    it "returns http success" do
      get '/posts/', params: { topic_id: my_topic.id, id: my_post.id }
      expect(response.status).to eq 200
    end
     
    it "renders the #show view" do
      get "/posts/", params: { topic_id: my_topic.id, id: my_post.id }
       expect(response).to render_template(:show)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get '/posts/new', params: { topic_id: my_topic.id }
      expect(response.status).to eq 200
    end
 
    it "renders the #new view" do
      get '/posts/new', params: { topic_id: my_topic.id }
      expect(response).to render_template :new
    end
  end
 
  describe "POST create" do
    it "increases the number of Post by 1" do
      expect{ post '/posts', params: { topic_id: my_topic.id, post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Post,:count).by(1)
    end

    it "redirects to the new post" do
      post '/posts', params: { topic_id: my_topic.id, post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(response).to redirect_to [my_topic, Post.last]
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get "/posts/#{my_topic_id}/#{my_post.id}/edit"
      expect(response.status).to eq 200
    end
 
    it "renders the #edit view" do
      get "/posts/#{my_topic.id}/#{my_post.id}/edit"
      expect(response).to render_template(:edit)
    end
 
    it "assigns post to be updated to @post" do
      get "/posts/#{my_post.id}/edit"
 
      post_instance = my_post
 
      expect(post_instance.id).to eq my_post.id
      expect(post_instance.title).to eq my_post.title
      expect(post_instance.body).to eq my_post.body
    end
  end
   
  describe "PUT update" do
    it "updates post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
 
      put "/posts/#{my_post.id}", { topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body } }
      updated_post = my_post.reload
      
      expect(updated_post.id).to eq my_post.id
      expect(updated_post.title).to eq new_title
      expect(updated_post.body).to eq new_body
     end
 
     it "redirects to the updated post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
 
       put "/posts/#{my_post.id}", params: { topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body } }
       expect(response).to redirect_to [my_topic, my_post]
     end
   end
   
  describe "DELETE destroy" do
    it "deletes the post" do
      delete "/posts/#{my_topic.id}/#{my_post.id}" 
      
      count = Post.where({id: my_post.id}).size
      expect(count).to eq 0
    end
 
    it "redirects to posts index" do
      delete "/posts/#{my_topic.id}/#{my_post.id}" 
      expect(response).to redirect_to my_topic
    end
  end
end
