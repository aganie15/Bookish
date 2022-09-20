class CreateCopies < ActiveRecord::Migration[7.0]
  def change
    create_table :copies do |t|
      t.string :book_id
      t.string :borrower
      t.string :due_date

      t.timestamps
    end
  end
end
