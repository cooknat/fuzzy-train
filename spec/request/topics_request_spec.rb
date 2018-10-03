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
end
