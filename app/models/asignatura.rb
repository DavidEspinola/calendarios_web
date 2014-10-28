class Asignatura < ActiveRecord::Base
	has_many :patron_clases, dependent: :destroy
	has_many :clases, through: :patron_clases

	has_many :patron_asignaturas
	has_many :programas, through: :patron_asignaturas

	has_many :datos_calendarios
	has_many :calendarios, through: :datos_calendarios

	has_many :asig_tags
	has_many :tags, through: :asig_tags
end
