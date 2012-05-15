class FriendsWithsController < ApplicationController
  # GET /friends_withs
  # GET /friends_withs.json
  def index
    @friends_withs = FriendsWith.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @friends_withs }
    end
  end

  # GET /friends_withs/1
  # GET /friends_withs/1.json
  def show
    @friends_with = FriendsWith.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @friends_with }
    end
  end

  # GET /friends_withs/new
  # GET /friends_withs/new.json
  def new
    @friends_with = FriendsWith.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @friends_with }
    end
  end

  # GET /friends_withs/1/edit
  def edit
    @friends_with = FriendsWith.find(params[:id])
  end

  # POST /friends_withs
  # POST /friends_withs.json
  def create
    @friends_with = FriendsWith.new(params[:friends_with])

    respond_to do |format|
      if @friends_with.save
        format.html { redirect_to @friends_with, :notice => 'Friends with was successfully created.' }
        format.json { render :json => @friends_with, :status => :created, :location => @friends_with }
      else
        format.html { render :action => "new" }
        format.json { render :json => @friends_with.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /friends_withs/1
  # PUT /friends_withs/1.json
  def update
    @friends_with = FriendsWith.find(params[:id])

    respond_to do |format|
      if @friends_with.update_attributes(params[:friends_with])
        format.html { redirect_to @friends_with, :notice => 'Friends with was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @friends_with.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /friends_withs/1
  # DELETE /friends_withs/1.json
  def destroy
    @friends_with = FriendsWith.find(params[:id])
    @friends_with.destroy

    respond_to do |format|
      format.html { redirect_to friends_withs_url }
      format.json { head :ok }
    end
  end
end
