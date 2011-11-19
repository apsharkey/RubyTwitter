class PostsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @post = current_user.posts.build(params[:post])
    
    if grab_user_reference(@post.content)
        query = grab_user_reference(@post.content)
        @search = User.search do
          keywords query
        end
        @theuser = @search.results
      
      # @notification = @theuser[0].notifications.create(:content => @post.content.strip, :author => current_user.username)
    end
    
    if @post.save
      redirect_to root_path
    else
      @_items = []
      render 'pages/home'
    end
  end

  def destroy
      @post = Post.find(params[:id]).destroy
      redirect_to :back
  end
  
end
