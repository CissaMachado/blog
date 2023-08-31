require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'POST#create' do
    it 'criando um novo comentário' do
      user = User.create!(email: 'test@example.com', password: 'password')

      article = Article.create!(title: 'title', body: 'blabla bla bla', picture: 'picture', user: user)

      sign_in(user)

      comment_params = { body: 'Este é um ótimo artigo!' }

      expect do
        post :create, params: { article_id: article.id, comment: comment_params }
      end.to change(Comment, :count).by(1)

      expect(response).to redirect_to(assigns(:article))
    end
  end
  describe 'DELETE#destroy' do
    it 'excluindo um comentário' do
      user = User.create!(email: 'test@example.com', password: 'password')

      article = Article.create!(title: 'title', body: 'blabla bla bla', picture: 'picture', user: user)
      sign_in(user)

      comment = Comment.create!(body: 'Este é um ótimo artigo!', article: article, user: user)

      expect do
        delete :destroy, params: { id: comment.id, article_id: article.id }
      end.to change(Comment, :count).by(-1)

      expect(response).to redirect_to(article_path(article))
    end
  end
end
