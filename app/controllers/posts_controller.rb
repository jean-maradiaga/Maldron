class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

def index
  if params[:category].blank?
    @posts = Post.all.order("created_at DESC")
  else
    @category_id = Category.find_by(name: params[:category]).id
    @posts = Post.where(category_id: @category_id).order("created_at DESC")
  end
end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Update successful'
    else
      render 'edit'
    end
  end

  def create
    # render plain: params[:post].inspect
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'The post was created!'
    else
      render 'new'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Post deleted'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :category_id)
    end
end
