class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :web_resource, type: :uuid, null: false, foreign_key: true
      t.string :comment, default: '', null: false

      t.timestamps
    end
  end
end
