class RssSourcesController < ApplicationController
  # GET /rss_sources
  # GET /rss_sources.json
  def index
    @rss_sources = current_user.rss_sources.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @rss_sources }
    end
  end

  # GET /rss_sources/1
  # GET /rss_sources/1.json
  def show
    @rss_source = RssSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @rss_source }
    end
  end

  # GET /rss_sources/new
  # GET /rss_sources/new.json
  def new
    @rss_source = RssSource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @rss_source }
    end
  end

  # GET /rss_sources/1/edit
  def edit
    @rss_source = RssSource.find(params[:id])
  end

  # POST /rss_sources
  # POST /rss_sources.json
  def create
    @rss_source = RssSource.new(params[:rss_source])
    @rss_source.user_id = current_user.id;
    respond_to do |format|
      if @rss_source.save
        format.html { redirect_to @rss_source, :notice => 'Rss source was successfully created.' }
        format.json { render :json => @rss_source, :status => :created, :location => @rss_source }
      else
        format.html { render :action => "new" }
        format.json { render :json => @rss_source.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rss_sources/1
  # PUT /rss_sources/1.json
  def update
    @rss_source = RssSource.find(params[:id])

    respond_to do |format|
      if @rss_source.update_attributes(params[:rss_source])
        format.html { redirect_to @rss_source, :notice => 'Rss source was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @rss_source.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rss_sources/1
  # DELETE /rss_sources/1.json
  def destroy
    @rss_source = RssSource.find(params[:id])
    @rss_source.destroy

    respond_to do |format|
      format.html { redirect_to rss_sources_url }
      format.json { head :ok }
    end
  end
end
