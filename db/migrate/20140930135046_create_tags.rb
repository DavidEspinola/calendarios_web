class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.string "nombre"
    	t.text "descripcion"
    	t.integer "tipo"
		t.timestamps
    end
  end
end
