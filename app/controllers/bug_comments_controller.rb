class BugCommentsController < ApplicationController

  before_filter :require_login
  
  def new
     @bug_comment = BugComment.new
     @bug = Bug.find(params[:bug_id])
  end
  
  # POST /bugs/:bug_id/comments
  def create
    @bug_comment = BugComment.new(params[:bug_comment])
    @bug_comment.bug = Bug.find(params[:bug_id])
    @bug_comment.creator = current_user
    @bug = Bug.find(params[:bug_id])
    @bug.attributes = params[:bug]
    
    if @bug_comment.valid? && @bug.valid?
      @bug_comment.save
      @bug.save
        redirect_to(@bug_comment.bug, :notice => 'Comment was successfully created.')
      else
        render :action => "new" 
      end
  end

end
