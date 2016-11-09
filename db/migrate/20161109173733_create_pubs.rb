class CreatePubs < ActiveRecord::Migration[5.0]
  def change
    create_table :pubs do |t|
      t.string :name
      t.string :image
      t.string :location

      t.timestamps
    end
  end
end
