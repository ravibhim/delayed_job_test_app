Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.max_attempts = 10
Delayed::Worker.max_run_time = 25

# Plugin
module Delayed
  module Plugins
    class SuccessLog < Plugin
      module Notify
        def success job
          attrs = job.attributes
          attrs['delayed_job_id'] = attrs.delete('id')
          CompletedJob.create(attrs)
        end
      end

      callbacks do |lifecycle|
        lifecycle.before(:invoke_job) do |job|
          payload = job.payload_object
          payload = payload.object if payload.is_a? Delayed::PerformableMethod
          payload.extend Notify
        end
      end
    end
  end
end

Delayed::Worker.plugins << Delayed::Plugins::SuccessLog
