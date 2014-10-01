class Tag < ActiveRecord::Base
	has_many :asig_tags
	has_many :programas, through: :asig_tags
	has_many :asignaturas, through: :asig_tags
	has_many :clases, through: :asig_tags
end
