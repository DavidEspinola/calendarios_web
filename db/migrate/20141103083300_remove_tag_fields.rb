class RemoveTagFields < ActiveRecord::Migration
  def change
  	remove_column :asignaturas, :asig_tag_id
  	remove_column :clases, :asig_tag_id
  	remove_column :programas, :tag_id
  end
end
