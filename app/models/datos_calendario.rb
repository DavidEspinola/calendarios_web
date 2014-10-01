class DatosCalendario < ActiveRecord::Base
	belongs_to :asignatura
	belongs_to :calendario
	belongs_to :clase
end
