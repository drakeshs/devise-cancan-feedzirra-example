class RssTest < ActiveRecord::Base
  attr_accessible :author, :status, :title, :url, :user_id, :description
  belongs_to :user

  def self.rss_feeds
   select("url,title,author").where(:status => 0)
  end
end

