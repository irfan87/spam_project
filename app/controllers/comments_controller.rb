class CommentsController < ApplicationController
	before_action :set_comments, only: [:show, :edit, :update, :destroy]

	def create
  	 @post = Post.find(params[:post_id])
     @comment = @post.comments.new(comment_params)
     @comment.user = current_user
     @comment.update(body: @comment.body)
     @comment.save

     if @comment.save
       # redirect_to "/posts/#{@post.id}"
       redirect_to @post
     else
      render :new
    end
  end

  def show
  end


  def edit
    @post = Post.find(params[:post_id])
  end

  def update
    @post = Post.find(params[:post_id])
  
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to "/posts/#{@post.id}", notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: 'Comment was successfully deleted.' }
    end
  end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post_id, :body, :user_id)
    end

end