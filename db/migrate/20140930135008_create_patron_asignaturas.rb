class CreatePatronAsignaturas < ActiveRecord::Migration
  def change
    create_table :patron_asignaturas do |t|
		t.integer   "calendario_id"
		t.integer   "asignatura_id"
		t.integer  "orden"
		t.integer     "desfase"
		t.timestamps
    end
  end
end
