Factory.define :user, :class => User do |u|
  u.name 'John'
  u.email 'john@doe.com'
  u.password '102030'
end

Factory.define :user_jack, :class => User do |u|
  u.name 'Jack'
  u.email 'jack@johson.com'
  u.password '102030'
end

Factory.define :question do |q|
 q.title 'My question'
 q.text 'This is the question test!'
 q.association :user
end
