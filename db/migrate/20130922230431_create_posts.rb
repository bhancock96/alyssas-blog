class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :title
    	t.text :content
    	t.belongs_to :admin
    	
      t.timestamps
    end
  end
end
