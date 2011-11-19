class RepostsController < ApplicationController
    before_filter :authenticate_user!

    def create
      @repost = Repost.create(params[:repost])


      if @repost.save
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
      
    else
      respond_to do |format|
        format.html { redirect_to contact_path }
        format.js
      end
      
    end

  end
  

    def destroy
      @repost = Repost.find(params[:id]).destroy
      redirect_to :back
    end

  end
