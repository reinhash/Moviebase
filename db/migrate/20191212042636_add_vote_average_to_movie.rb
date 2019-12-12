class AddVoteAverageToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :vote_average, :integer
  end
end
