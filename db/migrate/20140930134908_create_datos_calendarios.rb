class CreateDatosCalendarios < ActiveRecord::Migration
  def change
    create_table :datos_calendarios do |t|
    	t.integer   "calendario_id"
		t.integer   "asignatura_id"
		t.integer  "clase_id"
		t.datetime     "inicio"
		t.datetime     "fin"
    	t.timestamps
    end
  end
end
