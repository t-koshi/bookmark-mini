class CreateFullyQualifiedDomainNames < ActiveRecord::Migration[6.0]
  def change
    create_table :fully_qualified_domain_names, id: :uuid do |t|
      t.string :value, null: false

      t.timestamps
    end

    add_index :fully_qualified_domain_names, [:value], unique: true
  end
end
