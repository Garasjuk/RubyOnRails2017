class AddDescriptionColumn < ActiveRecord::Migration[5.1]
  def change
	add_column :tasks, :status, :text
	
	
  end
end
