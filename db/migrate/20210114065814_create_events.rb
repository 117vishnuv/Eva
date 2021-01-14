class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :body
      t.datetime :date
      t.boolean :status

      t.timestamps
    end
  end
end
