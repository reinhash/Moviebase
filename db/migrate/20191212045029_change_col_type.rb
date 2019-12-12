class ChangeColType < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :vote_average, :decimal
  end
end
