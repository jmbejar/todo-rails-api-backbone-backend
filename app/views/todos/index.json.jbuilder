json.array!(@todos) do |todo|
  json.extract! todo, :id, :title, :completed, :order
  json.url todo_url(todo, format: :json)
end
