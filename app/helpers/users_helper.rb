module UsersHelper
  def activity_trackable_content activity
    trackable_type = activity.trackable_type
    @trackable = Settings.activity.trackable[trackable_type.downcase].content
  end
end
