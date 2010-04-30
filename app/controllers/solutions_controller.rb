class SolutionsController < ApplicationController
  
  before_filter :require_login, :except => [:index, :show]
  
  # GET /solutions
  # GET /solutions.xml
  def index
    @solutions = Solution.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @solutions }
    end
  end

  # GET /solutions/1
  # GET /solutions/1.xml
  def show
    @solution = Solution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @solution }
    end
  end

  # GET /solutions/new
  # GET /solutions/new.xml
  def new
    @solution = Solution.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @solution }
    end
  end

  # POST /solutions
  # POST /solutions.xml
  def create
    @solution = Solution.new(params[:solution])
    @solution.creator = current_user
    

    respond_to do |format|
      if @solution.save
        format.html { redirect_to(@solution, :notice => 'Solution was successfully created.') }
        format.xml  { render :xml => @solution, :status => :created, :location => @solution }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @solution.errors, :status => :unprocessable_entity }
      end
    end
  end

end
