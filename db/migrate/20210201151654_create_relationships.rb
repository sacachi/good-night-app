class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.integer :following_id, index: true
      t.integer :followed_id, index: true

      t.timestamps
    end
  end
end
