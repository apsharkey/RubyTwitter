require 'spec_helper'
require 'devise/test_helpers'

describe UsersController do
  render_views
  
  # ====================================================================================
  describe "GET 'index'" do # Find People
    
        describe "for non-signed-in users" do
          
          it "should deny access" do
            get :index
            response.should redirect_to(new_user_session_path)
          end
        
        end
    
        describe "for signed-in-users" do
            
            login_user # log in @user with Devise (initializers/controller_macros.rb)

            it "should be successful" do
              get :index
              response.should be_success
            end
            
            it "should have the right title" do
              get :index
              response.should have_selector('title', :content => "Whom to Follow")
            end     
        
        end

  end # END describe "GET 'index'" do
  # ====================================================================================
  describe "GET 'show'" do # Profile
    login_user
    
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
    
    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector('title', :content => @user.username)
    end
  
    
  end # END describe "GET 'show'" do
  # ====================================================================================
  
  
  
  
  
  
end # END UsersController