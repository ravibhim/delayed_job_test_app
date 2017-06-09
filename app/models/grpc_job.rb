GrpcJob = Struct.new(:name) do
  def perform
    raise GRPC::BadStatus.new(400,'boom')
    puts "GRPC gem is not the problem!"
  end

  def max_attempts
    1
  end

  def error(job, exception)
    puts "ERROR hook for job id #{job.id}"
  end

  def failure(job)
    puts "FAILURE hook for job id #{job.id}"
  end
end
