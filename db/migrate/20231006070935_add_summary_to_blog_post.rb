class AddSummaryToBlogPost < ActiveRecord::Migration[7.1]
  def change
    add_column :blog_posts, :summary, :string, null: true
    BlogPost.update_all(summary: "")
    change_column_null :blog_posts, :summary, false
  end
end
