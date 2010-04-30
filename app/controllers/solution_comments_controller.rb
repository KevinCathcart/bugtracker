class SolutionCommentsController < ApplicationController

  before_filter :require_login
  
  def new
     @solution_comment = SolutionComment.new
     @solution = Solution.find(params[:solution_id])
  end
  
  # POST /solutions/:solution_id/comments
  def create
    @solution_comment = SolutionComment.new(params[:solution_comment])
    @solution_comment.solution = Solution.find(params[:solution_id])
    @solution_comment.creator = current_user
    @solution = Solution.find(params[:solution_id])
    @solution.attributes = params[:solution]
    
    if @solution_comment.valid? && @solution.valid?
      @solution_comment.save
      @solution.save
        redirect_to(@solution_comment.solution, :notice => 'Comment was successfully created.')
      else
        render :action => "new" 
      end
  end

end
