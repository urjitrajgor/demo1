class UsersController < ApplicationController
 
  def new
    @user = User.new
    $current_user = @user.id
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = "Successfully created..."
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }

      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def login
    @message = "Enter your login password"
  end

  def signup
    @user = User.find_by_name_and_password(params[:login][:name],params[:login][:password])
    if @user.nil?
      @message = "Username and password does not match"
      render :action => 'login'
    else
      $current_user = @user.id
      $user_name = @user.name
      redirect_to user_deshbord_path(@user)
      
    end
  end

  def logout
    $current_user = nil
    redirect_to "/"
  end
end
