class Pausa < ActiveRecord::Base
	has_many :patron_descansos
	has_many :descansos, through: :patron_descansos
end
