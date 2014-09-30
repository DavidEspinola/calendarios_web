class CreatePatronClases < ActiveRecord::Migration
  def change
    create_table :patron_clases do |t|
    	t.integer "asignatura_id"
    	t.integer "clase_id"
    	t.integer "orden"
    	t.integer "duracion"
		t.timestamps
    end
  end
end
