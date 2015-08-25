class YouTrack::Client::Model
  def self.ms_time
    @_ms_time ||= lambda { |v, _|
      begin
        Time.at(*Integer(v).divmod(1000))
      rescue ArgumentError
        v
      end
    }
  end

  def require_admin!
    raise YouTrack::NotAnAdminError unless service.current_user.admin?
  end

  # @todo add to cistern
  def read_attribute_for_serialization(n)
    attributes[n]
  end
end
