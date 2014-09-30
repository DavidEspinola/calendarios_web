class CreateCalendarios < ActiveRecord::Migration
  def change
    create_table :calendarios do |t|
    	t.integer "programa_id"
    	t.text "texto_extra"
    	t.datetime "convocatoria"
    	t.integer "descanso_id"
      t.timestamps
    end
  end
end
