class BugsController < ApplicationController
  
  before_filter :require_login, :except => [:index, :show]
  
  # GET /bugs
  # GET /bugs.xml
  def index
    @bugs = Bug.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bugs }
    end
  end

  # GET /bugs/1
  # GET /bugs/1.xml
  def show
    @bug = Bug.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bug }
    end
  end

  # GET /bugs/new
  # GET /bugs/new.xml
  def new
    @bug = Bug.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bug }
    end
  end

  # POST /bugs
  # POST /bugs.xml
  def create
    @bug = Bug.new(params[:bug])
    @bug.creator = current_user
    

    respond_to do |format|
      if @bug.save
        format.html { redirect_to(@bug, :notice => 'Bug was successfully created.') }
        format.xml  { render :xml => @bug, :status => :created, :location => @bug }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bug.errors, :status => :unprocessable_entity }
      end
    end
  end

end
