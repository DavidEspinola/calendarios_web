class RemoveTagIndexes < ActiveRecord::Migration
  def change
  	remove_index(:asignaturas, :name => 'index_asignaturas_on_asig_tag_id')
  	remove_index(:clases, :name => 'index_clases_on_asig_tag_id')
  	remove_index(:programas, :name => 'index_programas_on_tag_id')
  end
end
