class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :title,                       null: false
      t.text :body,                          null: false
      t.string :song_player
      t.string :song_title
      t.string :artist
      t.string :song_image
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
