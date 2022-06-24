class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :user
      t.belongs_to :product
      t.timestamps
    end
  end
end
