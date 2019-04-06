# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Load Applicants

Applicant.delete_all
if File.exist?("./data/applicants.cvs")
  File.foreach("./data/applicants.cvs") do |line|
    next if line.eql? ('')
    data_applicant = line.strip.tr(' ','').split(',')
    Applicant.create(plate: data_applicant[0], vehicle_type: data_applicant[1])
  end
else
  puts 'No existe archivo para cargar Candidatos'
end

# Load Parkings

Parking.delete_all

if File.exist?("./data/parking.cvs")
  File.foreach("./data/parking.cvs") do |line|
    next if line.eql? ('')
    data_parking = line.strip.tr(' ','').split(',')
    Parking.create(name: data_parking[0], parking_type: data_parking[1])
  end
else
  puts 'No existe archivo para cargar Parqueaderos'
end
