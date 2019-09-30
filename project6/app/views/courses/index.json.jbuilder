json.array!(@courses) do |course|
  json.extract! course, :id, :cname, :user_id, :semester
  json.url course_url(course, format: :json)
end
