class BugSolutionsController < ApplicationController
  
  before_filter :require_login
  
  # GET /bug/1/solutions/new
  def new
    @bug = Bug.find(params[:bug_id])
  end
  
  # POST /bug/1/solutions
  def create
    @bug = Bug.find(params[:bug_id])
    @solution = Solution.find(params[:solution_id])
    if @bug.solutions.push(@solution)
      redirect_to bug_path(@bug)
    else
      flash[:notice] = "That solution could not be added"
      render :action => "new"
    end
  rescue
    flash[:notice] = "That solution could not be added"
    render :action => "new"
  end
  
  # DELETE /bug/1/solution/6764
  def destroy
    @bug = Bug.find(params[:bug_id])
    @bug.solutions.delete(Solution.find(params[:id]))
    redirect_to bug_path(@bug)
  end
end
