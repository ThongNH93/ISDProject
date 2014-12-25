class CreateStatuses < ActiveRecord::Migration

  def migrate(direction)
    super
    # Create a default user
    Status.create!(name: 'Loại', priority:-1 ) if direction == :up
    Status.create!(name: 'Chờ duyệt', priority:0 ) if direction == :up
    Status.create!(name: 'Duyệt', priority:1 ) if direction == :up
  end

  def change
    create_table :statuses do |t|
      t.string :name
      t.integer :priority

      t.timestamps
    end
  end
end