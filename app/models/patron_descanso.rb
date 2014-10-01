class PatronDescanso < ActiveRecord::Base
	belongs_to :descanso
	belongs_to :pausa
end
