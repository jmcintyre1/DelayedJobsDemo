class CreateJobItems < ActiveRecord::Migration[5.2]
  def change
    create_table :job_items do |t|
      t.string :title

      t.timestamps
    end
  end
end
