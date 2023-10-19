class CreateJoinTableTagsMicroposts < ActiveRecord::Migration[7.1]
  def change
    create_join_table :tags, :microposts, primary_key: [:tag_id, :micropost_id] do |t|
      t.index [:tag_id, :micropost_id]
      t.index [:micropost_id, :tag_id]
    end
  end
end
