class CreateRoles < ActiveRecord::Migration
  def migrate(direction)
    super
    # Create a default user
    Role.create!(name: "Super admin") if direction == :up
  end
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
