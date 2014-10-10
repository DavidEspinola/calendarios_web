class PatronClase < ActiveRecord::Base
	belongs_to :asignatura
	belongs_to :clase
end
#TODO: Revisar que la eliminación de asignaturas o clases destruya las relaciones existentes.