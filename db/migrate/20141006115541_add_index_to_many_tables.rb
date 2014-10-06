class AddIndexToManyTables < ActiveRecord::Migration
	def change
		add_index :asig_tags, :recurso_id
		add_index :asig_tags, :tag_id

		add_index :asignaturas, :asig_tag_id


		add_index :calendarios, :programa_id
		add_index :calendarios, :descanso_id

		add_index :clases, :asig_tag_id

		add_index :datos_calendarios, :calendario_id
		add_index :datos_calendarios, :asignatura_id
		add_index :datos_calendarios, :clase_id


		add_index :patron_asignaturas, :calendario_id
		add_index :patron_asignaturas, :asignatura_id

		add_index :patron_clases, :asignatura_id
		add_index :patron_clases, :clase_id

		add_index :patron_descansos, :descanso_id
		add_index :patron_descansos, :pausa_id

		add_index :programas, :tag_id
	end
end
