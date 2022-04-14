class AddHowOldToBoards < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :how_old, :integer
  end
end
