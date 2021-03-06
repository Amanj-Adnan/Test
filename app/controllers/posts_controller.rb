class PostsController < ApplicationController
  before_action :authenticate_user! , only: [:edit, :update,:new,:create,:destroy]

  before_action :set_params ,only: [:edit,:update ,:destroy ,:show]

  def index

  end

  def show
  end

  def edit
    authorize @post
  end

  def new
    @post_new = Post.new
  end


  def create
    @post_new = current_user.posts.new(get_params)
    if @post_new.save

      redirect_to root_path
    else
      render :new

    end
  end

  def update
    puts(current_user.id)
    puts(@post)
    authorize @post

    if @post.update(get_params)

      redirect_to root_path

    else
      render :edit
    end

  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to root_path
  end

  private

  def get_params
    params.require(:post).permit(:user_id ,:title , :body)
  end

  def set_params
    @post = Post.find(params[:id])
  end

end
