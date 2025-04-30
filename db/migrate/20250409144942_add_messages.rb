class AddMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      
      t.text :body, null: false
     

      t.timestamps
    end

    
  end
end
