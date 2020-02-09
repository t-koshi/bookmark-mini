class CreateWebResources < ActiveRecord::Migration[6.0]
  def change
    create_table :web_resources, id: :uuid do |t|
      t.references :fully_qualified_domain_name, type: :uuid, foreign_key: true, null: false
      t.string :title, null: false
      t.text :url, default: '', null: false
      t.text :description, default: ''
      t.text :favicon_url, default: ''
      t.text :ogp_image_url, default: ''
      t.integer :users_count, default: 0

      t.timestamps
    end
  end
end
