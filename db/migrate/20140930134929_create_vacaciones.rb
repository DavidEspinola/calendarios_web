class CreateDescansos < ActiveRecord::Migration
  def change
    create_table :descansos do |t|
		t.string   "nombre"
		t.timestamps
    end
  end
end
