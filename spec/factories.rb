Factory.define :user do |u|
  u.name 'John'
  u.email 'john@doe.com'
  u.password '102030'
end

Factory.define :question do |q|
  q.title 'My question'
  q.text 'This is the question test!'
  q.association :user
end
