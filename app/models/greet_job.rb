GreetJob = Struct.new(:name, :greeting) do
  def perform
    raise 'boom'
    puts "#{greeting} #{name}"
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
