class BugCommentsController < ApplicationController
  
  def new
     @bug_comment = BugComment.new
     @bug = Bug.find(params[:bug_id])
  end
  
  # POST /bugs/:bug_id/comments
  def create
    @bug_comment = BugComment.new(params[:bug_comment])
    @bug_comment.bug = Bug.find(params[:bug_id])
    @bug_comment.creator = current_user
    
    if @bug_comment.save
        redirect_to(@bug_comment.bug, :notice => 'Comment was successfully created.')
      else
        render :action => "new" 
      end
  end

end
