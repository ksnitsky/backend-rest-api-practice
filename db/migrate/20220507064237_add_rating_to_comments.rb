class AddRatingToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :commentaries, :rating, :integer, default: 0
  end
end
