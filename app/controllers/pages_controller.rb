class PagesController < ApplicationController  
  def home
    @title = "Home"
     if user_signed_in?
        @location = GeoIp.geolocation(user_ip.to_s)
        @post = Post.new
        @feed_items = current_user.feed.paginate(:page => params[:page])
        @suggestions = User.find(:all, :offset => random_offset)
        @following_previews = current_user.following(:limit => 7)
        @followers_previews = current_user.followers(:limit => 7)
        @posts = Post.find(:all)
        # @notifications = Notification.find(:all)
        
        respond_to do |format|
          format.html # index.html.erb
          format.js
          format.xml  { render :xml => @feed_items }
        end
      end
    @user = User.new


  end
  
  def about
     # About this Site
  end
  
  def feeder
        @feed_items = current_user.feed.paginate(:page => params[:page])
        respond_to do |format|
          format.html # index.html.erb
          format.js
          format.xml  { render :xml => @feed_items }
        end
  end

  def contact
    @title = "Contact"
  end
  
  def following?(followed)
    relationships.find_by_followed_id(followed)
  end
  
  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end
  
  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end
  
  def random_offset
    offset = (rand(User.count) - 4)
      if offset < 0
        offset = 0
      end
      if num_of_users_not_being_followed <= 3
        offset = 0
      end
      offset
  end
  
end
