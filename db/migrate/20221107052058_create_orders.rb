class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :num
      t.string :recipient
      t.string :tel
      t.string :address
      t.string :state, default: 'pending'
      t.string :note
      t.belongs_to :user, null: false, foreign_key: true
      t.datetime :paid_at
      t.string :transaction_id

      t.timestamps
    end
  end
end
