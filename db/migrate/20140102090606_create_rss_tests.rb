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

git filter-branch --commit-filter '
 if [ "$GIT_COMMITTER_NAME" = "kiran-panzer" ];
  then
                GIT_COMMITTER_NAME="D Rakesh Sharma";
                GIT_AUTHOR_NAME="D Rakesh Sharma";
                GIT_COMMITTER_EMAIL="drakeshs@gmail.com";
                GIT_AUTHOR_EMAIL="drakeshs@gmail.com";
                git commit-tree "$@";
        else
                git commit-tree "$@";
        fi' HEAD