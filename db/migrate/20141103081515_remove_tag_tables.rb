class RemoveTagTables < ActiveRecord::Migration
  def change
  	drop_table :tags
  	drop_table :asig_tags
  end
end
