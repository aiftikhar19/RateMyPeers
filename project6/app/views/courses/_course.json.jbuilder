json.extract! course, :id, :cname, :semester, :user_id, :created_at, :updated_at
json.url course_url(course, format: :json)
