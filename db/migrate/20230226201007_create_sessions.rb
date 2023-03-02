class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.text :notes, array: true, default: []
      t.timestamps
    end
  end
end
