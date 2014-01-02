class HomeController < ApplicationController
  def index
   @feeds =  RssTest.rss_feeds
  end
end
