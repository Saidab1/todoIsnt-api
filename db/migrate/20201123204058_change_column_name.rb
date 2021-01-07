class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :project_name, :name
    rename_column :projects, :project_color, :color
  end
end
