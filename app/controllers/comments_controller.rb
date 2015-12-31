class CommentsController < ApplicationController
	before_action :set_comments, only: [:show, :edit, :update, :destroy]

	def new
    @post = Post.find(params[:post_id])
	  @comment = Comment.new
	end

	def create
  	 @post = Post.find(params[:post_id])
     @comment = @post.comments.new(comment_params)

   if @comment.save
     redirect_to "/posts/#{@post.id}"
   else
    render :new
    end
  end

  def show
  end


  def edit
  end



private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments
      @comments = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post_id, :body)
    end


end