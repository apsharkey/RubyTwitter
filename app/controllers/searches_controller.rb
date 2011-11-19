class SearchesController < ApplicationController
  def index
    if params[:q]
      query = params[:q]
        @search_posts = Post.search do
          keywords query
        end
        @results = @search_posts.results

    elsif params[:query]
      query = params[:query]
        @search_posts = Post.search do
          keywords query
        end

        @results = @search_posts.results
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.js  { }
    end
  
  end

end
