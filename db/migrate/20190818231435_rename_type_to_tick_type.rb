class RenameTypeToTickType < ActiveRecord::Migration[5.2]
  def change
    rename_column :tickets, :type, :tick_type
  end
end
