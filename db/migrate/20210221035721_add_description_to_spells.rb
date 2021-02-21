class AddDescriptionToSpells < ActiveRecord::Migration[6.1]
  def change
    add_column :spells, :desc, :text
    add_column :spells, :higher_level, :string
    add_column :spells, :range, :string
    add_column :spells, :components, :string
    add_column :spells, :material, :string
    add_column :spells, :ritual, :boolean
    add_column :spells, :duration, :string
    add_column :spells, :concentration, :boolean
    add_column :spells, :casting_time, :string
    add_column :spells, :level, :integer
    add_column :spells, :attack_type, :string
    add_column :spells, :damage_type, :string
    add_column :spells, :school, :string
    add_column :spells, :classes, :string
    add_column :spells, :subclasses, :string

  end
end
