class RenameTable < ActiveRecord::Migration
  def change
    rename_table :den, :dens
  end
end
