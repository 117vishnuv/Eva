json.array! @notifications do |notification|
  json.id notification.id 
  json.actor notification.actor.name 
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.url event_path(notification.notifiable.event, anchor: dom_id(notification.notifiable))
end
