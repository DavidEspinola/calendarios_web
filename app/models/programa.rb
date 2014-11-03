class Programa < ActiveRecord::Base
	has_many :patron_asignaturas
	has_many :asignaturas, through: :patron_asignaturas

	has_many :calendarios
end
