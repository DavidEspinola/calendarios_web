class RemoveTipoFromTags < ActiveRecord::Migration
  def up
  	remove_column :tags, :tipo
  	add_column :asig_tags, :tipo, :integer
  end
  def down
  	add_column :tags, :tipo, :integer
  	remove_column :asig_tags, :tipo
  end
end
