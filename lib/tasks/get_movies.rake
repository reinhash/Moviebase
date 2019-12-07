
require 'json'
require 'csv'

task :get_movies => :environment do
    include HTTParty
    #response = HTTParty.get('http://www.omdbapi.com/?s=*&apikey=e9bbf01e')
    response = HTTParty.get('http://www.omdbapi.com/?s=love&apikey=e9bbf01e')

    puts response

    #csv_text = File.read(Rails.root.join('lib', 'assets', 'data_to_csv.csv'))
    #csv_text = File.read('../data_to_csv.csv')
    #csv = CSV.parse(csv_text, :headers => true)
    #csv.each do |row|
    #    General.create!(row.to_hash)
    #end
    #puts "successfully imported the Fencers into the Generals Table"
end