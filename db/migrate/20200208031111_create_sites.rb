class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites, id: :uuid do |t|
      t.references :fully_qualified_domain_name, type: :uuid, foreign_key: true, null: false
      t.string :title, null: false
      t.text :url, default: '', null: false
      t.text :description, default: '', null: false
      t.text :ogp_image_url, default: '', null: false
      t.integer :users_count, defult: 0, null: false

      t.timestamps
    end
  end
end
