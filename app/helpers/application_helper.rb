

module ApplicationHelper
   def pageless(total_pages, url=nil, parent_container=nil, container=nil)
     opts = {
       :totalPages => total_pages,
       :url        => url,
       :parent_container => parent_container,
       :distance => 20,
       :loaderImage  => '../images/load.gif'
     }

     container && opts[:container] ||= container

     javascript_tag("$('#feed_pool').pageless(#{opts.to_json});")
   end
   
  # Return a title on a per-page basis.
  def title
    base_title = "An Andy Sharkey Production"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def linkup_mentions_and_hashtags(text)    
    text.gsub!(/@([\w]+)(\W)?/, '<a href="/users/\1">@\1</a>\2')
    text.gsub!(/#([\w]+)(\W)?/, '<a href="/search/\1">#\1</a>\2')
    text.gsub!(/^((http|https?:\/\/)?((?:[-a-z0-9]+\.)+[a-z]{2,}))$/, '<a href="/\1">\1</a>')
    
    text
  end

  def highlight_search_query(text, query)
    text.gsub!(/#{query}/, "<span class='bold'>#{query}</span>")
  end

  def wrap_text(txt, col = 60)
    txt.gsub(/(.{1,#{col}})( +|$\n?)|(.{1,#{col}})/, "\\1\\3\n") 
  end
  
  def wrap(content)
      sanitize(raw(content.split.map{ |s| wrap_long_string(s) }.join(' ')))
    end

  def wrap_long_string(text, max_width = 45)
      zero_width_space = "&#8203;"
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text : 
                                text.scan(regex).join(zero_width_space)
  end
  
  def grab_trend(text)
    if text.include? "#"
      trend = text.scan(/#([\w]+)(\W)?/)
      update_trending(trend)
    end
  end
  
	def grab_user_reference(text) 
    if text.include? "@"
      text.scan(/@([\w]+)(\W)?/)
    end
  end
  
  def update_trending(trend)
    @trend = Trend.new
    @trend.content = trend
  end
  
  def num_of_users_not_being_followed
    @totalusers = User.find(:all)
    x = @totalusers.count.to_i - current_user.following.count.to_i
  end

 def logo
   image_tag("../images/twitterlogo.png", :alt => "Logo" )
 end
 
  def show_default_thumb_for_user(user)
     if user.id.to_s.scan(/0$/).join == "0"
       image_tag("../images/user_defaults/0_thumb.png")
     elsif user.id.to_s.scan(/1$/).join == "1"
       image_tag("../images/user_defaults/1_thumb.png") 
     elsif user.id.to_s.scan(/2$/).join == "2"
       image_tag("../images/user_defaults/2_thumb.png")
     elsif user.id.to_s.scan(/3$/).join == "3"
       image_tag("../images/user_defaults/3_thumb.png")
     elsif user.id.to_s.scan(/4$/).join == "4"
       image_tag("../images/user_defaults/4_thumb.png")
     elsif user.id.to_s.scan(/5$/).join == "5"
       image_tag("../images/user_defaults/5_thumb.png")
     elsif user.id.to_s.scan(/6$/).join == "6"
       image_tag("../images/user_defaults/6_thumb.png")
     elsif user.id.to_s.scan(/7$/).join == "7"
       image_tag("../images/user_defaults/3_thumb.png")
     elsif user.id.to_s.scan(/8$/).join == "8"
       image_tag("../images/user_defaults/5_thumb.png")
     elsif user.id.to_s.scan(/9$/).join == "9"
       image_tag("../images/user_defaults/4_thumb.png")
     end
  end
  
  def show_default_small_for_user(user)
     if user.id.to_s.scan(/0$/).join == "0"
       image_tag("../images/user_defaults/0_small.png")
     elsif user.id.to_s.scan(/1$/).join == "1"
       image_tag("../images/user_defaults/1_small.png") 
     elsif user.id.to_s.scan(/2$/).join == "2"
       image_tag("../images/user_defaults/2_small.png")
     elsif user.id.to_s.scan(/3$/).join == "3"
       image_tag("../images/user_defaults/3_small.png")
     elsif user.id.to_s.scan(/4$/).join == "4"
       image_tag("../images/user_defaults/4_small.png")
     elsif user.id.to_s.scan(/5$/).join == "5"
       image_tag("../images/user_defaults/5_small.png")
     elsif user.id.to_s.scan(/6$/).join == "6"
       image_tag("../images/user_defaults/6_small.png")
     elsif user.id.to_s.scan(/7$/).join == "7"
       image_tag("../images/user_defaults/3_small.png")
     elsif user.id.to_s.scan(/8$/).join == "8"
       image_tag("../images/user_defaults/5_small.png")
     elsif user.id.to_s.scan(/9$/).join == "9"
       image_tag("../images/user_defaults/4_small.png")
     end
  end
  
  def show_default_tiny_for_user(user)
     if user.id.to_s.scan(/0$/).join == "0"
       image_tag("../images/user_defaults/0_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/1$/).join == "1"
       image_tag("../images/user_defaults/1_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/2$/).join == "2"
       image_tag("../images/user_defaults/2_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/3$/).join == "3"
       image_tag("../images/user_defaults/3_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/4$/).join == "4"
       image_tag("../images/user_defaults/4_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/5$/).join == "5"
       image_tag("../images/user_defaults/5_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/6$/).join == "6"
       image_tag("../images/user_defaults/6_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/7$/).join == "7"
       image_tag("../images/user_defaults/3_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/8$/).join == "8"
       image_tag("../images/user_defaults/5_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/9$/).join == "9"
       image_tag("../images/user_defaults/4_thumb.png", :class => "resizeme")
     end
  end
  
  def show_default_suggestion(user)
     if user.id.to_s.scan(/0$/).join == "0"
       image_tag("../images/user_defaults/0_thumb.png", :class => "resize_suggestion")
     elsif user.id.to_s.scan(/1$/).join == "1"
       image_tag("../images/user_defaults/1_thumb.png", :class => "resize_suggestion")
     elsif user.id.to_s.scan(/2$/).join == "2"
       image_tag("../images/user_defaults/2_thumb.png", :class => "resize_suggestion")
     elsif user.id.to_s.scan(/3$/).join == "3"
       image_tag("../images/user_defaults/3_thumb.png", :class => "resize_suggestion")
     elsif user.id.to_s.scan(/4$/).join == "4"
       image_tag("../images/user_defaults/4_thumb.png", :class => "resize_suggestion")
     elsif user.id.to_s.scan(/5$/).join == "5"
       image_tag("../images/user_defaults/5_thumb.png", :class => "resize_suggestion")
     elsif user.id.to_s.scan(/6$/).join == "6"
       image_tag("../images/user_defaults/6_thumb.png", :class => "resize_suggestion")
     elsif user.id.to_s.scan(/7$/).join == "7"
       image_tag("../images/user_defaults/3_thumb.png", :class => "resize_suggestion")
     elsif user.id.to_s.scan(/8$/).join == "8"
       image_tag("../images/user_defaults/5_thumb.png", :class => "resize_suggestion")
     elsif user.id.to_s.scan(/9$/).join == "9"
       image_tag("../images/user_defaults/4_thumb.png", :class => "resize_suggestion")
     end
  end
  
  def show_default_homepage(user)
     if user.id.to_s.scan(/0$/).to_s == "0"
       image_tag("../images/user_defaults/0_thumb.png", :class => "resize_homepage")
     elsif user.id.to_s.scan(/1$/).to_s == "1"
       image_tag("../images/user_defaults/1_thumb.png", :class => "resize_homepage")
     elsif user.id.to_s.scan(/2$/).to_s == "2"
       image_tag("../images/user_defaults/2_thumb.png", :class => "resize_homepage")
     elsif user.id.to_s.scan(/3$/).to_s == "3"
       image_tag("../images/user_defaults/3_thumb.png", :class => "resize_homepage")
     elsif user.id.to_s.scan(/4$/).to_s == "4"
       image_tag("../images/user_defaults/4_thumb.png", :class => "resize_homepage")
     elsif user.id.to_s.scan(/5$/).to_s == "5"
       image_tag("../images/user_defaults/5_thumb.png", :class => "resize_homepage")
     elsif user.id.to_s.scan(/6$/).to_s == "6"
       image_tag("../images/user_defaults/6_thumb.png", :class => "resize_homepage")
     elsif user.id.to_s.scan(/7$/).to_s == "7"
       image_tag("../images/user_defaults/3_thumb.png", :class => "resize_homepage")
     elsif user.id.to_s.scan(/8$/).to_s == "8"
       image_tag("../images/user_defaults/5_thumb.png", :class => "resize_homepage")
     elsif user.id.to_s.scan(/9$/).to_s == "9"
       image_tag("../images/user_defaults/4_thumb.png", :class => "resize_homepage")
     end
  end
  
  def show_menu_pic(user)
     if user.id.to_s.scan(/0$/).join == "0"
       image_tag("../images/user_defaults/0_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/1$/).join == "1"
       image_tag("../images/user_defaults/1_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/2$/).join == "2"
       image_tag("../images/user_defaults/2_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/3$/).join == "3"
       image_tag("../images/user_defaults/3_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/4$/).join == "4"
       image_tag("../images/user_defaults/4_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/5$/).join == "5"
       image_tag("../images/user_defaults/5_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/6$/).join == "6"
       image_tag("../images/user_defaults/6_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/7$/).join == "7"
       image_tag("../images/user_defaults/3_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/8$/).join == "8"
       image_tag("../images/user_defaults/5_thumb.png", :class => "resizeme")
     elsif user.id.to_s.scan(/9$/).join == "9"
       image_tag("../images/user_defaults/4_thumb.png", :class => "resizeme")
     end
  end

  
  
def user_ip
  local_ip = request.remote_ip
  if (local_ip.to_s == "127.0.0.1".to_s)
    my_ip = (require 'open-uri' ; open("http://myip.dk") { |f| /([0-9]{1,3}\.){3}[0-9]{1,3}/.match(f.read)[0].lines.to_a[0] })
  else
    request.remote_ip
  end # end if statement
end # end user_ip
end # end application helper