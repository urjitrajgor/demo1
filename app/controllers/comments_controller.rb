class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = params[:user_id]
    @comment.artical_id = params[:artical_id]
    if @comment.save
      respond_to do |format|
        flash[:notice] = "comment was successfullyv created"
        @comments = Comment.find(:all , :conditions => ['artical_id =?', params[:artical_id]])
        format.html { redirect_to view_artical_path(params[:user_id], params[:artical_id] ) }
        format.js
        
      end
    end
  end

  def delete
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      @comments = Comment.find(:all ,:conditions => ['artical_id =?', params[:artical_id]])
      format.html { redirect_to view_artical_path(params[:user_id],params[:artical_id]) }
      format.js
    end
  end

  
end