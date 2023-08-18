class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @recent_posts = Article.order(created_at: :desc).limit(3)
    @articles = Article.all
  end

  def show
    @article = Article.includes(comments: :user).find(params[:id])
    @comments = @article.comments
  end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to @article
    else
      puts @article.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      puts @article.errors.full_messages # Imprime mensagens de erro no console
      render :edit, status: :unprocessable_entity
    end
  end
  

  def destroy
    if @article.destroy
      redirect_to root_path, notice: 'Articles Destroyed'
    else
      redirect_to root_path, alert: 'Articles not Destroyed'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :picture)
  end

  def set_article
    @article = Article.find_by(id: params[:id])

    return unless @article.nil?

    redirect_to articles_path, alert: 'Article not found.'
  end
end
