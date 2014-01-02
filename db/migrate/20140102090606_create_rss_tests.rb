class CreateRssTests < ActiveRecord::Migration
  def change
    create_table :rss_tests do |t|
      t.string  :url
      t.string  :title
      t.string  :author
      t.text    :description
      t.integer :user_id
      t.boolean :status, :default => 0

      t.timestamps
    end
  end
end
