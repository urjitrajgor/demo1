class ArticalsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @artical = Artical.new
    
  end

  def create
    @user = User.find(params[:user_id])
    @artical = Artical.new(params[:artical])
    @artical.user_id = params[:user_id]
    @artical.rate= 0
    respond_to do |format|
      if @artical.save
        flash[:notice] = "Successfully created..."
        format.html { redirect_to user_artical_path(@user, @artical), :notice => 'artical was successfully created.' }
      else
        format.html{ render :action => 'new'}
        format.xml{ render :xml => @artical.errors, :status => :unprocessable_entity }
      end

    end
  end

  def show
    @user = User.find(params[:user_id])
    @artical = Artical.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @artical = Artical.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @artical = Artical.find(params[:id])
    respond_to do |format|
      if @artical.update_attributes(params[:artical])
        format.html { redirect_to user_artical_path(@user,@artical),:notice => 'successfully update'}
        format.xml { head :ok}
      else
        format.html { render  :action => "edit"}
        format.xml {render :xml => artical.errors, :status => :unprocessable_entity}
      end
    end
  end

  def delete
    @user = User.find(params[:user_id])
    @artical = Artical.find(params[:artical_id])
    @artical.destroy

    respond_to do |format|
      format.html{redirect_to user_deshbord_path(@user.id)}
      format.js{ render :nothing => true }
    end
  end

  def view_artical
    flash[:notice] = ""
    $message = "please login to comment"
    
    @user = User.find(params[:user_id])
    @artical = Artical.find(params[:artical_id])
    @comment = Comment.new
    @comments = Comment.find(:all, :conditions => ["artical_id =?",params[:artical_id]])
  end

  def rate_artical
    @size = Rate.count(:all, :conditions => ['artical_id =?' ,params[:artical_id]]) + 1
    @artical = Artical.find(params[:artical_id])
    @new_rate =  ( @artical.rate + params[:artical][:rate].to_i ) / @size
    @artical.rate = @new_rate
    @rate = Rate.new
    @rate.user_id = params[:user_id]
    @rate.artical_id = params[:artical_id]

    if @rate.save
      @artical.save
      redirect_to view_artical_path(@user_id,@artical_id)
  
    end
  end
end
