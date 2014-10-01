class PatronClase < ActiveRecord::Base
	belongs_to :asignatura
	belongs_to :clase
end
