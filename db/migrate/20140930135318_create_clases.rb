class CreateClases < ActiveRecord::Migration
  def change
    create_table :clases do |t|
		t.string   "nombre"
		t.text   "descripcion"
		t.string "recursos"
		t.integer "asig_tag_id"
		t.timestamps
    end
  end
end
