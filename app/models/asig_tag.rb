class AsigTag < ActiveRecord::Base
	belongs_to :clase
	belongs_to :asignatura
	belongs_to :programa
end
