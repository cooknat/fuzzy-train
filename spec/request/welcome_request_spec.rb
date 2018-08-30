# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeController, type: :request do
  describe 'get index' do
    it 'returns the page with a 200 status' do
      get '/welcome/index'
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get '/welcome/index'
      expect(response).to render_template('index')
    end
  end

  describe 'get about' do
    it 'returns the page with a 200 status' do
      get '/welcome/about'
      expect(response.status).to eq 200
    end

    it 'renders the about template' do
      get '/welcome/about'
      expect(response).to render_template('about')
    end
  end

  describe 'get contact' do
    it 'returns the page with a 200 status' do
      get '/welcome/contact'
      expect(response.status).to eq 200
    end

    it 'renders the contact template' do
      get '/welcome/contact'
      expect(response).to render_template('contact')
    end
  end

  describe 'get faq' do
    it 'returns the page with a 200 status' do
      get '/welcome/faq'
      expect(response.status).to eq 200
    end

    it 'renders the about template' do
      get '/welcome/faq'
      expect(response).to render_template('faq')
    end
  end
end
