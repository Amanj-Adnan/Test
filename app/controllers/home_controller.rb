class HomeController < ApplicationController
  def show
    @posts = Post.all
  end
end
