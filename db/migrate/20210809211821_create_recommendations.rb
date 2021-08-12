class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.integer :rating
      t.integer :user_id
      t.integer :company_id
      t.text :comment

      t.timestamps
    end
  end
end
