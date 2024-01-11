json.extract! student, :id, :name, :email, :age, :major, :gpa, :year_of_graduation, :address, :phone_number, :created_at, :updated_at
json.url student_url(student, format: :json)
