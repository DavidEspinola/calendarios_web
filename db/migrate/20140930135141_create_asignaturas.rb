class CreateAsignaturas < ActiveRecord::Migration
  def change
    create_table :asignaturas do |t|
    	t.string   "nombre"
		t.text   "descripcion"
		t.integer "asig_tag_id"
		t.timestamps
    end
  end
end
