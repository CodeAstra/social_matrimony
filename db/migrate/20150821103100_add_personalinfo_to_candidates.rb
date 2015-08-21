class AddPersonalinfoToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :marital_status, :integer
    add_column :candidates, :caste, :integer
    add_column :candidates, :subcaste, :integer
    add_column :candidates, :gothram, :string
    add_column :candidates, :height, :string
    add_column :candidates, :weight, :string
    add_column :candidates, :bodytype, :integer
    add_column :candidates, :complexion, :integer
    add_column :candidates, :physicalstatus, :integer
    add_column :candidates, :salary, :string
    add_column :candidates, :food, :integer
    add_column :candidates, :smoke, :integer
    add_column :candidates, :drink, :integer
    add_column :candidates, :dosham, :integer
    add_column :candidates, :star, :string
    add_column :candidates, :rashi, :string
    add_column :candidates, :familytype, :integer
    add_column :candidates, :familyvalues, :integer
    add_column :candidates, :familystatus, :integer
  end
end
