class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :room, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
