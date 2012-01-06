class WelcomeController < ApplicationController

  def index
    @welcome = "Select the following link"
    @articals = Artical.find(:all ,:conditions =>["published = 1"] )
    
    
  end

  def user_deshbord
    @user = User.find(params[:user_id])
    @articals = @user.articals
  end

end
