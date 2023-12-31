require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/users'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'return 200' do
      expect(response.status).to eq(200)
    end
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
    it 'include the list of all users' do
      expect(response.body).to include('Here is a list of user')
    end
  end

  describe 'GET /show' do
    before(:each) do
      get '/users/1'
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'return 200' do
      expect(response.status).to eq(200)
    end
    it 'renders the show template' do
      expect(response).to render_template('show')
    end
    it 'include the details of a user' do
      expect(response.body).to include('Details for a selected user with post')
    end
  end
end
