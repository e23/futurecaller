class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.integer :num_to_call
      t.text :text_to_say
      t.integer :caller_id
      t.string :voice_id
      t.string :time_to_call

      t.timestamps
    end

    add_index :calls, :time_to_call
  end
end
