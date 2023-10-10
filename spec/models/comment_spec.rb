require 'rails_helper'

RSpec.describe Comment do
  it 'has comments' do
    user = User.create!(email: 'ceciliadsmachado@gmailcom', password: 'password')
    article = Article.new(
      title: 'titulo',
      body: 'Corpo do artigo com pelo menos 10 caracteres',
      user: user
    )
    comment = Comment.new(
      body: 'commentario generico para teste',
      article: article,
      user: user
    )

    expect(comment.user).to eq(user)
  end
end
