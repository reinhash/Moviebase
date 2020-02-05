task :import_suggested_movies => :environment do
    require 'roo'
    workbook = Roo::Excelx.new(File.join(__dir__,"/suggestmovielist.xlsx")) # read xlsx file.
    workbook.default_sheet = workbook.sheets.first # select first sheet
    Movie.delete_all # delete all before insert 
    ((workbook.first_row + 1)..(workbook.last_row)).each do |row_number| # start loop from the second row, as first row has headings and map the data to local varaibles
        rank =  workbook.row(row_number)[0].to_s
        released = workbook.row(row_number)[1].to_s
        title = workbook.row(row_number)[2].to_s
        genre = workbook.row(row_number)[6].to_s
        all_movies = Movie.new(:title => title, :released => released,:genre => genre)  # insert data into table, you can also do bulk inset if you have more data to be inserted.
        all_movies.save 
    end

    puts "done"
end