class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :body
    	t.string :author
    	t.belongs_to :post

      t.timestamps
    end
  end
end
