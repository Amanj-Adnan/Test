class Admin::PostsController <  ApplicationController
  before_action :authorized_admin
  layout('admin' )


  def index
    @allposts = Post.all
    render "admin/posts/index"
  end


end

