require 'rails_helper'

RSpec.describe Article do
  it 'belongs to a user' do
    user = User.create!(email: 'test@example.com', password: 'password')
    article = Article.create!(
      title: 'Test Article',
      body: 'Article body content',
      user: user
    )

    expect(article.user).to eq(user)
  end
end
