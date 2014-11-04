class AddSearchFields < ActiveRecord::Migration
  def change
    add_column :clases, :keywords, :text
    add_column :asignaturas, :keywords, :text
    add_column :programas, :keywords, :text
  end
end
