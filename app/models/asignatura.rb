class Asignatura < ActiveRecord::Base
	has_many :patron_clases, dependent: :destroy
	has_many :clases, through: :patron_clases

	has_many :patron_asignaturas
	has_many :programas, through: :patron_asignaturas

	has_many :datos_calendarios
	has_many :calendarios, through: :datos_calendarios

	scope :search, ->(keyword){ where('keywords LIKE?',"%#{keyword.downcase}%") if keyword.present?}

	before_save :generar_keywords

	protected
		def generar_keywords
			self.keywords = [nombre,descripcion,tags].map(&:downcase).join(' ')
		end
end
