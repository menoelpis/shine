class CreateStrongs < ActiveRecord::Migration
  def change
    create_table :strongs do |t|
      t.string :strongsid,      null: false
      t.string :lemma          
      t.string :xlit           
      t.string :pronounce      
      t.text   :description      
      t.string :partofspeech   
      t.string :language       
    end

    add_index :strongs, :strongsid
  end
end
