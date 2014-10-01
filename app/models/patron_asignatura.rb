class PatronAsignatura < ActiveRecord::Base
	belongs_to :asignatura
	belongs_to :programa
end
