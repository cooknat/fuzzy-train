require 'rails_helper'
require 'random_data'

RSpec.describe TopicsController, type: :request do
  
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }

  describe "GET #index" do
    it "returns http success" do
      get '/topics'
      expect(response.status).to eq 200
    end
    
     it "renders the index template" do
      get '/topics'
      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    it "returns http success" do
      get '/topics/', params: { id: topic.id }
      expect(response.status).to eq 200
    end
     
    it "renders the #show view" do
      get "/topics/#{topic.id}"
      expect(response).to render_template(:show)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get '/topics/new'
      expect(response).to have_http_status(:success)
     end
 
    it "renders the #new view" do
      get '/topics/new'
      expect(response).to render_template :new
     end
  end


  describe "POST create" do
    it "increases the number of topics by 1" do
      expect{ post '/topics/', params: { topic: { name: RandomData.random_sentence, description: RandomData.random_paragraph } } }.to change(Topic,:count).by(1)
    end 

    it "redirects to the new topic" do
      post '/topics/', params: { topic: { name: RandomData.random_sentence, description: RandomData.random_paragraph } }
      expect(response).to redirect_to Topic.last
    end
  end

  describe "GET edit" do
     it "returns http success" do
       get "/topics/#{topic.id}/edit/"
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get "/topics/#{topic.id}/edit/"
       expect(response).to render_template :edit
     end
 
     # it "assigns topic to be updated to @topic" do
     #   get :edit, params: {id: my_topic.id}
     #   topic_instance = assigns(:topic)
 
     #   expect(topic_instance.id).to eq my_topic.id
     #   expect(topic_instance.name).to eq my_topic.name
     #   expect(topic_instance.description).to eq my_topic.description
     # end
   end
end
