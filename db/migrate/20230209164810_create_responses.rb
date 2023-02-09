class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.integer    :date,     null: false
      t.integer    :cost
      t.string     :title,    null: false
      t.text       :content,  null: false
      t.references :user,     null: false, foreign_key: true
      t.references :incident, null: false, foreign_key: true
      t.timestamps
    end
  end
end
