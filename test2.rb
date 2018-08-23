def read_student
  file = File.open('student.csv', 'r')
  data = file.readlines.map{ |ele| ele.split(', ').map(&:chomp) }
  file.close
  file_saved = File.open('promedios.csv', 'w')
  data.each do |people|
    sum = 0
    people.each do |a|
      sum += a.to_f
    end
    approved = sum / (people.length-1)

    file_saved.puts "El alumno #{people[0]} tiene un promedio de #{approved}"

  end
  file_saved.close

  return nil
end

def total_absence
  file = File.open('student.csv', 'r')
  data = file.readlines.map{ |ele| ele.split(', ').map(&:chomp) }
  file.close

  puts '######################Cantidad de inasistencias######################'
  data.each do |absence|
    name = absence[0]
    fault = absence.count('A')

    puts "#{name} tiene #{fault} inasistencias"
  end
  puts '################################################################################'
end

def approved_student
  file = File.open('student.csv', 'r')
  data = file.readlines.map{ |ele| ele.split(', ').map(&:chomp) }
  file.close

  approved = 0
  name = 0
  puts 'Escribir el promedio con la cual los alumnos pasaran'
  puts '################################################################################'
  puts ''
  c = gets.chomp.to_f
  puts '######################Alumnos aprobados######################'
  data.each do |info|
    approved = 0
    sum = 0

    info.each do |a|
      sum += a.to_f
    end

    name = info[0]
    approved = sum / (info.length - 1)

    if c == 0
      puts "Alumnos que aprobados con un promedio mayor o igual a 5.0 | #{name} | Promedio: #{approved}" if approved >= 5
    elsif c <= approved
      puts "Alumnos que aprobados  con un promedio menor o igual a #{c} | #{name} | Promedio: #{approved}"
    end
  end
  puts '################################################################################'
end
opcion = 0
while opcion != 4
  puts '                      Ingresa una de estas opciones'
  puts '################################################################################'
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
