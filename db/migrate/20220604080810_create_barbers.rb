class CreateBarbers < ActiveRecord::Migration[7.0]
  def change
    create_table :barbers do |t|
    t.text :name
    t.timestamps
    end
    
    Barber.create :name => "Mumitroll"
    Barber.create :name => "Edvard"
    Barber.create :name => "Zaycev"
    
  end
end
