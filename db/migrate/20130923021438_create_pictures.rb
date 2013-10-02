class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
    	t.string :caption
    	t.string :source

      t.timestamps
    end
  end
end
