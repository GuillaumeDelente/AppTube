class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.integer :version

      t.timestamps
    end
  end
end
