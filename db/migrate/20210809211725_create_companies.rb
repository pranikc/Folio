class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.text :board_members
      t.integer :year
      t.string :industry

      t.timestamps
    end
  end
end
