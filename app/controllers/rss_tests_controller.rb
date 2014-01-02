class RssTestsController < ApplicationController
    load_and_authorize_resource

  # GET /rss_tests
  # GET /rss_tests.json
  def index
    @rss_tests = RssTest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rss_tests }
    end
  end

  # GET /rss_tests/1
  # GET /rss_tests/1.json
  def show
    @rss_test = RssTest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rss_test }
    end
  end

  # GET /rss_tests/new
  # GET /rss_tests/new.json
  def new
    @rss_test = RssTest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rss_test }
    end
  end

  # GET /rss_tests/1/edit
  def edit
    @rss_test = RssTest.find(params[:id])
  end

  # POST /rss_tests
  # POST /rss_tests.json
  def create
    @rss_test = RssTest.new(params[:rss_test])
    @rss_test.user = current_user
    begin
      feed = Feedzirra::Feed.fetch_and_parse(@rss_test.url)
      @rss_test.title = feed.title
      @rss_test.author = feed.author 
    rescue
      "no description"
    end
    respond_to do |format|
      if @rss_test.save
        format.html { redirect_to @rss_test, notice: 'Rss test was successfully created.' }
        format.json { render json: @rss_test, status: :created, location: @rss_test }
      else
        format.html { render action: "new" }
        format.json { render json: @rss_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rss_tests/1
  # PUT /rss_tests/1.json
  def update
    @rss_test = RssTest.find(params[:id])

    respond_to do |format|
      if @rss_test.update_attributes(params[:rss_test])
        format.html { redirect_to @rss_test, notice: 'Rss test was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rss_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rss_tests/1
  # DELETE /rss_tests/1.json
  def destroy
    @rss_test = RssTest.find(params[:id])
    @rss_test.destroy

    respond_to do |format|
      format.html { redirect_to rss_tests_url }
      format.json { head :no_content }
    end
  end
end
