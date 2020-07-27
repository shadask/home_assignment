class CreateWordCounters < ActiveRecord::Migration[5.0]
  def change
    create_table :word_counters do |t|
      t.string :input

      t.timestamps
    end
  end
end
