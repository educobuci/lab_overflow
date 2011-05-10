Factory.define :user do |u|
  u.name 'John'
  u.email 'john@doe.com'
  u.password '102030'
end

#Factory.define :question do |q|
#  user = Factory(:user)
#  q.title = 'My Question'
#  q.text = 'This is the question test!'
 
#end
