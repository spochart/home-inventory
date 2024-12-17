class CreateActiveSessions < ActiveRecord::Migration[7.2]
  def change
    create_table :active_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :remember_token, null: false, index: { unique: true }
      t.string :user_agent
      t.string :ip_address

      t.timestamps
    end
  end
end
