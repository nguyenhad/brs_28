module UsersHelper
  def activity_trackable_content activity
    trackable_type = activity.trackable_type
    @trackable = Settings.activity.trackable.relationship.content
  end
end
