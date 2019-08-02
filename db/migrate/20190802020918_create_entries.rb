class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.string :gratitude1
      t.string :gratitude2
      t.string :gratitude3
      t.string :gratitude4
      t.string :gratitude5
      t.string :gratitude6
      t.string :gratitude7
      t.string :gratitude8
      t.string :gratitude9
      t.string :gratitude10
      t.string :reflection1
      t.string :reflection2
      t.string :reflection3
      t.string :reflection4
      t.string :reflection5
      t.string :hopes1
      t.string :hopes2
      t.string :hopes3
      t.string :hopes4
      t.string :hopes5
      t.string :thoughts
      t.timestamps null: false
    end
  end
end
