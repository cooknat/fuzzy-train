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
end
