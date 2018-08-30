require 'rails_helper'

RSpec.describe WelcomeController, type: :request do
    
  describe 'get/index' do
    it 'returns the page with a 200 status' do
      get '/welcome/index'
      expect(response.status).to eq 200
    end
  end
  

end
