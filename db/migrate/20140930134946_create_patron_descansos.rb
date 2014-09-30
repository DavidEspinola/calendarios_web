class CreatePatronDescansos < ActiveRecord::Migration
  def change
    create_table :patron_descansos do |t|
		t.integer   "descanso_id"
		t.integer   "pausa_id"
		t.timestamps
    end
  end
end
