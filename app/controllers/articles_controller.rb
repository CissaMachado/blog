class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
    respond_to do |format|
    format.html { render :new, status: :unprocessable_entity }
    #render :new
     end
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update 
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
    respond_to do |format|
    format.html { render :edit, status: :unprocessable_entity }
     end
  end
end

  private 
  def article_params
    params.require(:article).permit(:title,:body)
  end
end
