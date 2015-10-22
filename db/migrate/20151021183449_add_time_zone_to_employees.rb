class AddTimeZoneToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :time_zone, :string, null: false, default: "UTC"
  end
end
