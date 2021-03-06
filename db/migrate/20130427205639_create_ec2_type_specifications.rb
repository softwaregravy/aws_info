class CreateEc2TypeSpecifications < ActiveRecord::Migration
  def change
    create_table :ec2_type_specifications do |t|
      t.string :name
      t.string :api_name
      t.string :api_type
      t.string :api_size
      t.integer :memory, limit: 8
      t.integer :compute_units
      t.boolean :support_32_bit
      t.boolean :support_64_bit
      t.integer :cores
      t.string :core_type
      t.integer :ephemeral_drives
      t.integer :total_ephemeral_storage, limit: 8
      t.integer :ebs_optimization
      t.string :io_performance
      t.boolean :spot_available
      t.string :notes
      t.integer :elastic_network_interfaces
      t.integer :private_ip_per_eni

      t.timestamps
    end
    add_index :ec2_type_specifications, :api_name, :unique => true
 
  end
end
