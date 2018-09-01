require 'rails_helper'

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
    
    it "assigns [my_post] to @posts" do
       get '/posts'
       expect(assigns(:posts)).to eq([my_post])
     end
  end
  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
