class AddPersonalinfoToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :marital_status, :integer
    add_column :candidates, :caste,          :integer
    add_column :candidates, :subcaste,       :integer
    add_column :candidates, :gothram,        :string
    add_column :candidates, :height,         :integer
    add_column :candidates, :weight,         :integer
    add_column :candidates, :body_type,      :integer
    add_column :candidates, :complexion,     :integer
    add_column :candidates, :physical_status,:integer
    add_column :candidates, :salary,         :integer
    add_column :candidates, :dosham,         :integer
    add_column :candidates, :star,           :integer
    add_column :candidates, :rashi,          :integer
    add_column :candidates, :food_habits,    :integer
    add_column :candidates, :smoking,        :integer
    add_column :candidates, :drinking,       :integer
    add_column :candidates, :family_type,    :integer
    add_column :candidates, :family_values,  :integer
    add_column :candidates, :family_status,  :integer
  end
end
