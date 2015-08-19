class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.date :birthday
      t.string :hometown
      t.string :location
      t.string :image

      t.timestamps null: false
    end
  end
end
