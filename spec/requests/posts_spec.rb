require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) do
    User.create(name: 'Anything',
                photo: 'http://licalhost:3000/anything.jpg',
                bio: 'Anything test',
                posts_counter: 0)
  end

  let!(:post) do
    Post.create(
      title: 'Anything',
      text: 'Anything test',
      author: user,
      comments_counter: 0,
      likes_counter: 0
    )
  end
  it 'rendered post template' do
    get "/users/#{user.id}/posts"
    expect(response).to render_template(:index)
  end
end
