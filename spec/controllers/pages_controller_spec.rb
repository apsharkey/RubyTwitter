require 'spec_helper'

describe PagesController do
  render_views # needed deleted the viewspecs and helperspecs 

  describe "GET 'Contact'" do
      it "should be successful" do
        get 'contact'
        response.should be_success
      end
  
      it "should have the right title" do
        get 'contact'
        response.should have_selector("title", 
        :content => "Contact")
      end
  end

  describe "GET 'Home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
  end



end # === END describe PagesController do ===