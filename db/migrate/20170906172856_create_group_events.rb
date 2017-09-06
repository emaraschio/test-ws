class CreateGroupEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :group_events do |t|
      t.string :name
      t.string :location
      t.boolean :published, default: false
      t.integer :duration
      t.date :start_date
      t.date :end_date
      t.text :description
      t.datetime :deleted_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
