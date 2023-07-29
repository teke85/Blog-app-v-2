require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe 'Users', type: :request do
  context 'GET /index' do
    it 'renders a successful response' do
      get users_url
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get users_url
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text' do
      get users_url
      expect(response.body).to include('<h1>Here is a list of users</h1>')
    end
  end
  context 'GET /show' do
    it 'renders a successful response' do
      get users_url(1)
      expect(response).to be_successful
    end
  end
end
