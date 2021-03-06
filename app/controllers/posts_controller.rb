class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    query = params[:q].presence || "*"
    #new @posts for pagination
    @posts = Post.search query, suggest: true
    @post = Post.order(click_count: :desc).page(params[:page]).per(3)
    if !current_user.nil?
      if current_user.username.nil?
          redirect_to edit_user_registration_path
      end
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @post.click_count += 1
    @post.save

    @post = Post.find(params[:id])
    comment = @post
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|
      if @post.save

      # Categories
        groups = []
        category_params[:categories][:group].split(",").each do |x|
        group = Category.find_or_initialize_by(group: x)
        group.save
        groups << group
        end
        
        @post.categories = groups
        @post.post_categories.create(post_id: params[:id])

        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def autocomplete
    render json: Post.search(params[:term], fields: [{title: :text_start}], limit: 10).map(&:title)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:user_id, :title, :body, :click_count, :photo )
    end

    def category_params
      params.require(:post).permit(:categories => [:id, :group])
    end
end
