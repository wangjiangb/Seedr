class ProspectiveUsersController < ApplicationController
  before_filter :authenticate

  # GET /prospective_users
  # GET /prospective_users.json
  def index
    @prospective_users = ProspectiveUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @prospective_users }
    end
  end

  # GET /prospective_users/1
  # GET /prospective_users/1.json
  def show
    @prospective_user = ProspectiveUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @prospective_user }
    end
  end

  # GET /prospective_users/new
  # GET /prospective_users/new.json
  def new
    @prospective_user = ProspectiveUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @prospective_user }
    end
  end

  # GET /prospective_users/1/edit
  def edit
    @prospective_user = ProspectiveUser.find(params[:id])
  end

  # POST /prospective_users
  # POST /prospective_users.json
  def create
        @prospective_user = ProspectiveUser.new(params[:prospective_user])
    # @prospective_user.fname = params[:fname]
    # @prospective_user.lname = params[:lname]
    @prospective_user.email = params[:email]
    @prospective_user.comment = params[:comment]
    @prospective_user.created_at = Time.now
    @prospective_user.updated_at = Time.now
    respond_to do |format|
      if @prospective_user.save
        format.html { redirect_to "/", :notice => 'Prospective user was successfully created.' }
        format.json { render :json => @prospective_user, :status => :created, :location => @prospective_user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @prospective_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prospective_users/1
  # PUT /prospective_users/1.json
  def update
    @prospective_user = ProspectiveUser.find(params[:id])

    respond_to do |format|
      if @prospective_user.update_attributes(params[:prospective_user])
        format.html { redirect_to @prospective_user, :notice => 'Prospective user was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @prospective_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prospective_users/1
  # DELETE /prospective_users/1.json
  def destroy
    @prospective_user = ProspectiveUser.find(params[:id])
    @prospective_user.destroy

    respond_to do |format|
      format.html { redirect_to prospective_users_url }
      format.json { head :ok }
    end
  end

protected

def authenticate
  authenticate_or_request_with_http_basic do |username, password|
    username == "admin" && password == "bigdata"
  end
end

end
