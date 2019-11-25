class ChangeAdoptionStatusToBoolean < ActiveRecord::Migration[5.1]
  def up
    change_column :pets, :adoption_status, 'boolean USING CAST(adoption_status AS boolean)', default: true
  end
end
