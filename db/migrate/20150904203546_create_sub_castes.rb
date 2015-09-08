class CreateSubCastes < ActiveRecord::Migration
  def change
    create_table :sub_castes do |t|
      t.string :name
      t.references :caste, index: true

      t.timestamps null: false
    end
    add_foreign_key :sub_castes, :castes
  end
end
