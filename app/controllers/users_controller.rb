class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create]
  
  def photo_settings
    
    
    respond_to do |format|
          format.html # index.html.erb
          format.js  { render :partial => 'photo_settings' }
    end
  end
  
  def profile_settings
    respond_to do |format|
          format.html # index.html.erb
          format.js  { render :partial => 'profile_settings' }
    end
  end
  
  def password_settings
    respond_to do |format|
          format.html # index.html.erb
          format.js  { render :partial => 'password_settings' }
    end
  end

  def index
    @title = "Whom to Follow"
    query = "AndySharkey"
    @search = User.search do
      keywords "AndySharkey"
    end
    
    @AndySharkey = @search.results
    @total_users = User.find(:all)
    @users = User.paginate(:page => params[:page])
    
   respond_to do |format|
      format.html # index.html.erb
      format.js  { render :partial => 'all_users' }
   end
      
      
          
  end
  
  def featured
    query = "AndySharkey"
    @search = User.search do
      keywords "AndySharkey"
    end
    @AndySharkey = @search.results
    
    respond_to do |format|
           format.html # index.html.erb
           format.js  { render :partial => 'featured'  }
     end
  end
  
  def strangers
    @users = User.find(:all)
    
    @following = current_user.following

    
    
    respond_to do |format|
          format.html # index.html.erb
          format.js  { render :partial => 'strangers'  }
    end
  end
  
  def show
      @user = User.find(params[:id])
      @feed_items = @user.profile_feed.paginate(:page => params[:page])
    
      @title = @user.username
      @following_previews = @user.following(:limit => 6)
      @followers_previews = @user.followers(:limit => 6)
      # @notifications = current_user.notifications
  end

  def following
    @title = "Following"
    
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    
    @following_previews = @user.following(:limit => 6)
    respond_to do |format|
          format.html
          format.js  { render :partial => 'show_follow' }
    end
  end
  
  def followers
    @title = "Followers"
    
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    
    @followers_previews = @user.followers(:limit => 6)
    respond_to do |format|
          format.html
          format.js  { render :partial => 'show_follow'  }
    end
  end
  
  def profile_feed
    @user = User.find(params[:id])
    @feed_items = @user.profile_feed.paginate(:page => params[:page])

    respond_to do |format|
          format.html # index.html.erb
          format.js  { render :partial => 'profile_feed'  }
    end
  end
  
  def favorites_feed
    @feed_items = current_user.profile_feed.paginate(:page => params[:page])
    respond_to do |format|
          format.html # index.html.erb
          format.js  { render :partial => 'shared/favorites_feed'  }
    end
  end
  
  def timeline_feed
    @feed_items = current_user.feed.paginate(:page => params[:page])
    respond_to do |format|
          format.html # index.html.erb
          format.js  { render :partial => 'shared/feed' }
    end  
  end
  
  def mentions_feed
    query = current_user.username
    @search = Post.search do
      keywords query
    end
    @mentions = @search.results

    respond_to do |format|
          format.html # index.html.erb
          format.js  { render :partial => 'shared/mentions_feed' }
    end
  end
  
  def reposts_feed
    @reposts = Repost.where(:reposter_id => current_user)
    
    respond_to do |format|
          format.html # index.html.erb
          format.js  { render :partial => 'shared/reposts_feed' }
    end
  end
  
  def searches_feed
    respond_to do |format|
          format.html # index.html.erb
          format.js  { render :partial => 'shared/searches_feed' }
    end
  end
  
  def lists_feed
    respond_to do |format|
          format.html # index.html.erb
          format.js  { render :partial => 'shared/lists_feed' }
    end
  end
  
  
  
  
  
end