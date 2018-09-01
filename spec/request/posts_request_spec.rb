require 'rails_helper'
require 'random_data'

RSpec.describe PostsController, type: :request do

  describe "GET #index" do
    
    let(:my_post) { Post.create!(title: 'title', body: 'body') }

    it "returns http success" do
      get '/posts'
      expect(response.status).to eq 200
    end
    
     it "renders the index template" do
      get '/posts'
      expect(response).to render_template(:index)
    end
  end
  
  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET new" do
    it "returns http success" do
      get '/posts/new'
      expect(response.status).to eq 200
    end
 
    it "renders the #new view" do
      get '/posts/new'
      expect(response).to render_template :new
    end
  end
 
  describe "POST create" do
    it "increases the number of Post by 1" do
      expect{ post '/posts', params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Post,:count).by(1)
    end

    it "redirects to the new post" do
      post '/posts', params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(response).to redirect_to Post.last
    end
  end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
