# def name
#   file = File.open('student.csv', 'r')
#   data = file.readlines.map{ |ele| ele.split(', ').map(&:chomp) }
#   file.close
#   data.each do |ele|
#     #print ele
#     puts ele[0]
#   end
# end
# # name
# #
# def promedio_1
#   file = File.open('student.csv', 'r')
#   data = file.readlines.map{ |ele| ele.split(', ').map(&:chomp) }
#   file.close
#   data.each do |people|
#     suma = 0
#     people.each do |a|
#       suma += a.to_f
#     end
#     promedio_1 = suma / (people.length-1)
#     puts promedio_1
#   end
# end
# promedio
# def crea_archivo
#   File.open('archivo.csv', 'w') do |file|
#   file.puts "El alumno #{name} tiene un promedio de #{promedio}"
#   #puts "El alumno #{name} tiene un promedio de #{promedio}"
# end
# end
# crea_archivo
######################################
# def notes
  # data = file.readlines.map{ |ele| ele.split(', ').map(&:chomp) }
  # file.close
  # data.each do |people|
  #   #print people
  #
  #   people.delete_at(0)
  #   print people
  # end
# end
# notes
########################################

def read_student
  file = File.open('student.csv', 'r')
  data = file.readlines.map{ |ele| ele.split(', ').map(&:chomp) }
  file.close
  file_saved = File.open('promedios.csv', 'w')
  data.each do |people|
    suma = 0
    people.each do |a|
      suma += a.to_f
    end
    promedio = suma / (people.length-1)

    file_saved.puts "El alumno #{people[0]} tiene un promedio de #{promedio}"

  end
  file_saved.close

  return nil
end

def total_absence

  # nombre = name
  #
  # file = File.open('student.csv', 'r')
  # data = file.readlines.map{ |ele| ele.split(', ').map(&:chomp) }
  # file.close
  # data.each do |people|
  #   people.delete_at(0)
  #   print people
  #   print people[0]
  #
  #   people.each do |i|
  #     ina = 0
  #     i.each do |x|
  #       ina += 1 if i == 'A'
  #       puts "El alunno #{nombre} a faltado #{x} veces"
  #     end
  #     puts "#{i}"
  #   end
  #   puts ' '
  # end
end

#total_absence
def approved_student
  # note = gets.chomp
  # if note == ""
  #   puts "El alumno #{name} tiene un promedio #{promedio_1} " if promedio >= 5

end

puts '################################################################################'
puts '                      Ingresa una de estas opciones'
puts '################################################################################'
opcion = 0
while opcion != 4
  puts 'Opcion 1: Generar archivo'
  puts 'Opcion 2: Cantidad de Inasistencias'
  puts 'Opcion 3: Alumnos aprobados'
  puts 'Opcion 4: Salir'
  puts '################################################################################'
  opcion = gets.chomp.to_i

  puts case opcion
  when 1
     read_student
  when 2
     total_absence
  when 3
     approved_student
  when 4
  else
    puts '¡ Esta alternativa es incorrecta !'
    puts '################################################################################'

  end
end
