module WelcomeHelper
  def session_time
    @time = Time.now
    @current_time = @time.strftime('%H:%M:%S')
  end
end
