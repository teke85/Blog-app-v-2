require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET /index' do
    it 'renders the correct template' do
      get users_path
      expect(response).to render_template('index')
    end
  end

  describe 'User GET /show' do
    # Create a user before the test
    let!(:user) { User.create(name: 'John Doe') }

    it 'returns success for detail user' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(200)
    end

    it 'user responsed body with correct place holder' do
      get '/users/'
      expect(response.body).to include('<h1>All users page placeholder</h1>')
    end

    it 'includes correct placeholder text' do
      get users_path
      expect(response.body).to include('<h1>All users page placeholder</h1>')
    end
  end
end
