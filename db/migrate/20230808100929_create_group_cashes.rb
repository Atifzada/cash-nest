class CreateGroupCashes < ActiveRecord::Migration[7.0]
  def change
    create_table :group_cashes do |t|

      t.timestamps
    end
  end
end
