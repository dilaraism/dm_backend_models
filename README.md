==Querying

[code]
	kant = Tag.get(1) # returns tag instance with id 1
	=> #<Tag @id=1 @name="İmmanuil Kant">
	kant.posts # returns post instances belongs to that tag
	=> ####
	kant.posts.count #returns count of instances
	=> 5
	kant.posts.first.author.first_name
	=> "John" # check my author class and first_name attribute.
	kant.posts.first.author.last_name
	=> "Doe"
    Tag.first(:name => "İmmanuil Kant").authors.sample.first_name
 	=> "John"
	p = Post.get(9)
    => # returns a post instance 
	p.tags
	=> [#<Tag @id=1 @name="İmmanuil Kant">, #<Tag @id=2 @name="Proloqomenlər">]
	Post.each {|pnt| puts pnt.id if pnt.tags.count.zero?}
	8  #returns id of post instance which doesn't have any tags
    Post.get(8).tags.count
 	=> 0 # get sure :) 	
[/code]

TODO: Update with relevant code and examples