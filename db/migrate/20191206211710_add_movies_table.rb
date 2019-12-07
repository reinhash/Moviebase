class AddMoviesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |m|
      m.string :title
      m.date :year
      m.string :released
      m.string :runtime
      m.string :genre
      m.string :director
      m.string :actors
      m.string :language
      m.string :country
      m.string :ratingsrottentomatos
      m.string :ratingsmetacritic
 
      m.timestamps
    end
  end
end
