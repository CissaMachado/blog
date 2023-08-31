require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET#index' do
    it 'retorno com sucesso' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET#show' do
    it 'Apresentado com sucesso' do
      user = User.create!(email: 'test@example.com', password: 'password')
      article = Article.create!(title: 'x:um filme', body: 'resenha sobre o filme de terror X', picture: 'picture',
                                user: user)
      get :show, params: { id: article.id }
      expect(response).to be_successful
    end
  end

  describe 'GET#new' do
    it 'assinado um new article' do
      user = User.create!(email: 'test@example.com', password: 'password')
      sign_in(user)
      get :new
      expect(assigns(:article)).to be_a_new(Article)
      expect(assigns(:article).user).to eq(user)
    end
  end

  describe 'POST#create' do
    it 'cria um novo article' do
      user = User.create!(email: 'test@example.com', password: 'password')
      sign_in(user)
      article_params = { title: 'Um filme', body: 'Resenha sobre o filme de terror', picture: 'picture' }

      expect do
        post :create, params: { article: article_params }
      end.to change(Article, :count).by(1)

      expect(response).to redirect_to(assigns(:article))
    end
  end

  describe 'PUT#update' do
    it 'atualiza com sucesso' do
      user = User.create!(email: 'test@example.com', password: 'password')
      article = Article.create!(title: 'Um filme', body: 'Resenha sobre o filme de terror', picture: 'picture',
                                user: user)

      sign_in(user)
      put :update, params: { id: article.id, article: { title: 'Novo título' } }
      expect(response).to redirect_to(assigns(:article))
      article.reload
      expect(article.title).to eq('Novo título')
    end
  end

  describe 'GET#edit' do
    it 'edita artigo com sucesso' do
      user = User.create!(email: 'test@example.com', password: 'password')
      article = Article.create!(title: 'Um filme', body: 'Resenha sobre o filme de terror', picture: 'picture',
                                user: user)

      sign_in(user)
      get :edit, params: { id: article.id }
      expect(response).to be_successful
    end
  end
  describe 'DELETE#destroy' do
    it 'excluir artigo com sucesso' do
      user = User.create!(email: 'test@example.com', password: 'password')
      article = Article.create!(title: 'Um filme', body: 'Resenha sobre o filme de terror', picture: 'picture',
                                user: user)

      sign_in(user)
      delete :destroy, params: { id: article.id }
      expect(response).to redirect_to(root_path)
    end
  end
end
