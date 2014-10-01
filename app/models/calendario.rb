class Calendario < ActiveRecord::Base
	has_many :datos_calendarios
	has_many :asignaturas, through: :datos_calendarios

	has_many :clases, through: :datos_calendarios

	belongs_to :programa
	belongs_to :descanso
end
