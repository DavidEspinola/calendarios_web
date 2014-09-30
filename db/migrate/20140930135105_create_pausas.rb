class CreatePausas < ActiveRecord::Migration
  def change
    create_table :pausas do |t|
		t.string   "nombre"
		t.datetime   "inicio"
		t.datetime "fin"
		t.timestamps
    end
  end
end
