class CompletedJobs < ActiveRecord::Migration
  def change
    create_table 'completed_jobs', force: true do |t|
      t.integer  'delayed_job_id', default: 0, null: false
      t.integer  'priority',       default: 0, null: false
      t.integer  'attempts',       default: 0, null: false
      t.text     'handler',        null: false
      t.text     'last_error'
      t.datetime 'run_at'
      t.datetime 'locked_at'
      t.datetime 'failed_at'
      t.string   'locked_by'
      t.string   'queue'
      t.datetime 'created_at'
      t.datetime 'updated_at'
      t.datetime 'deleted_at'
    end
  end
end
