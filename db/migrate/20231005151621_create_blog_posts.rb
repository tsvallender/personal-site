class CreateBlogPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_posts do |t|
      t.string :title, null: false
      t.references :user, null: false, foreign_key: true
      t.boolean :published, null: false, default: false
      t.string :slug, null: false

      t.timestamps
    end
  end
end
