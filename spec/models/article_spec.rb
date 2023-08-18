require 'rails_helper'

RSpec.describe Article do
  it 'has a title' do
    user = User.create!(email: 'john@example.com', password: 'password')

    article = Article.new(
      title: 'titulo',
      body: 'Corpo do artigo com pelo menos 10 caracteres',
      user: user
    )
    expect(article).to be_valid
  end
end
