class SuggestedKeywordsController < ApplicationController
  # GET /suggested_keywords
  # GET /suggested_keywords.json
  def index
    @suggested_keywords = SuggestedKeyword.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @suggested_keywords }
    end
  end

  # GET /suggested_keywords/1
  # GET /suggested_keywords/1.json
  def show
    @suggested_keyword = SuggestedKeyword.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @suggested_keyword }
    end
  end

  # GET /suggested_keywords/new
  # GET /suggested_keywords/new.json
  def new
    @suggested_keyword = SuggestedKeyword.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @suggested_keyword }
    end
  end

  # GET /suggested_keywords/1/edit
  def edit
    @suggested_keyword = SuggestedKeyword.find(params[:id])
  end

  # POST /suggested_keywords
  # POST /suggested_keywords.json
  def create
    @suggested_keyword = SuggestedKeyword.new(params[:suggested_keyword])

    respond_to do |format|
      if @suggested_keyword.save
        format.html { redirect_to @suggested_keyword, :notice => 'Suggested keyword was successfully created.' }
        format.json { render :json => @suggested_keyword, :status => :created, :location => @suggested_keyword }
      else
        format.html { render :action => "new" }
        format.json { render :json => @suggested_keyword.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /suggested_keywords/1
  # PUT /suggested_keywords/1.json
  def update
    @suggested_keyword = SuggestedKeyword.find(params[:id])

    respond_to do |format|
      if @suggested_keyword.update_attributes(params[:suggested_keyword])
        format.html { redirect_to @suggested_keyword, :notice => 'Suggested keyword was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @suggested_keyword.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /suggested_keywords/1
  # DELETE /suggested_keywords/1.json
  def destroy
    @suggested_keyword = SuggestedKeyword.find(params[:id])
    @suggested_keyword.destroy

    respond_to do |format|
      format.html { redirect_to suggested_keywords_url }
      format.json { head :ok }
    end
  end
end
