class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = @article.comments.build(comments_params)
    @comment.user = current_user

    if @comment.save
      redirect_to article_path(@article), notice: 'Comment was successfully created.'
    else
      redirect_to article_path(@article), alert: 'Comment could not be published.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to article_path(@comment.article), notice: 'Comment was successfully destroyed.'
    else
      redirect_to article_path(@comment.article), notice: 'Comment was not destroyed.'
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end
end
