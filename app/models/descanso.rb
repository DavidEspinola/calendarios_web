class Descanso < ActiveRecord::Base
	has_many :calendarios
	
	has_many :patron_descansos
	has_many :pausas, through: :patron_descansos
end
