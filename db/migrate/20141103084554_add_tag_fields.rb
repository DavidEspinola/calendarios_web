class AddTagFields < ActiveRecord::Migration
  def change
  	add_column :clases, :tags, :text
  	add_column :asignaturas, :tags, :text
  	add_column :programas, :tags, :text
  end
end
