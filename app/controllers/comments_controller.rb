class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = @article.comments.create(comments_params)
    @comment.user = current_user
    if @comment.save
      redirect_to article_path(@article), notice: 'Comment was successfully created.'
    else
      render :new, status: :unprocessable_entity, notice: 'comment não publicado'
    end
  end

  def destroy
    @comment.destroy

    redirect_to idea_path(@article), notice: 'Comment was successfully destroyed.'
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comments_params
    params.require(:comment).permit(:body)
  end
end
