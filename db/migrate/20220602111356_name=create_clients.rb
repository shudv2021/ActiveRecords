class Name=createClients < ActiveRecord::Migration[7.0]
  
  def change
    create_table :client do |t|
      t.text :name
      t.text :phone
      t.text :datestemp
      t.text :barber
      t.text :color
      t.timestamps
    end

end
