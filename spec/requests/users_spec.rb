require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET /index' do
    it 'renders the correct template' do
      get users_path
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text' do
      get users_path
      expect(response.body).to include('<h1>All users page placeholder</h1>')
    end
  end
end
