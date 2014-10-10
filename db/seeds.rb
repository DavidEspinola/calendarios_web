# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
PatronClase.delete_all
Clase.delete_all
Asignatura.delete_all

ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'clases'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'asignaturas'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'patron_clases'")

for i in 1..100
	Clase.create(nombre: "Clase #{i}", descripcion: "Esta es la clase #{i}.", recursos: "Url del SCORM en la red y otros recursos")
end

for i in 1..100
	Asignatura.create(nombre: "Asignatura #{i}", descripcion: "Esta es la asignatura #{i}.")
end

for i in 1..100
	for j in 1..5
		PatronClase.create(asignatura: Asignatura.find(i), clase: Clase.find(rand(j*20)+1), duracion: rand(7)+1, orden: 6-j)
	end
end