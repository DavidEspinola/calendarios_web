class Programa < ActiveRecord::Base
	has_many :patron_asignaturas
	has_many :asignaturas, through: :patron_asignaturas

	has_many :calendarios

	has_many :asig_tags
	has_many :tags, through: :asig_tags
end
