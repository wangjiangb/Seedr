class SearchBinsController < ApplicationController
  # GET /search_bins
  # GET /search_bins.json
  skip_before_filter :authorize
  def index
    @user= current_user
    if current_user==nil
      @search_bins = SearchBin.all
    else
      @search_bins = @user.search_bins;
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @search_bins }
    end
  end

  # GET /search_bins/1
  # GET /search_bins/1.json
  def show
    @search_bin = SearchBin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @search_bin }
    end
  end

  # GET /search_bins/new
  # GET /search_bins/new.json
  def new
    @search_bin = SearchBin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @search_bin }
    end
  end

  # GET /search_bins/1/edit
  def edit
    @search_bin = SearchBin.find(params[:id])
  end

  # POST /search_bins
  # POST /search_bins.json
  def create
    @user = current_user
    @search_bin = @user.search_bins.build(params[:search_bin])
    respond_to do |format|
      if @search_bin.save
        format.html { redirect_to "/admin", :notice => 'Search bin was successfully created.' }
        format.json { render :json => @search_bin, :status => :created, :location => @search_bin }
      else
        format.html { render :action => "new" }
        format.json { render :json => @search_bin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /search_bins/1
  # PUT /search_bins/1.json
  def update
    @search_bin = SearchBin.find(params[:id])

    respond_to do |format|
      if @search_bin.update_attributes(params[:search_bin])
        format.html { redirect_to @search_bin, :notice => 'Search bin was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @search_bin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /search_bins/1
  # DELETE /search_bins/1.json
  def destroy
    @search_bin = SearchBin.find(params[:id])
    @search_bin.destroy

    respond_to do |format|
      format.html { redirect_to search_bins_url }
      format.json { head :ok }
    end
  end
end
