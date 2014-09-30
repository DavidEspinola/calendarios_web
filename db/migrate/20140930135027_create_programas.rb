class CreateProgramas < ActiveRecord::Migration
  def change
    create_table :programas do |t|
    	t.string "nombre"
    	t.text "descripcion"
    	t.integer "tag_id"
		t.timestamps
    end
  end
end
