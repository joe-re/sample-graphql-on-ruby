# sample-graphql-on-ruby

try [graphql-ruby](https://github.com/rmosolgo/graphql-ruby)

## installation
```
$ bundle install
$ bundle exec ruby migration.rb
```

## usage

You can give graphql's query to cli.rb's argument and receive result hash.

```
$ bundle exec ruby cli.rb '{ post(id: 1) { id, title, comments {body} }}'
# => {"data"=>{"post"=>{"id"=>"1", "title"=>"test post 1", "comments"=>[]}}}
```

```
$ bundle exec ruby cli.rb '{ post(id: 2) { id, title, comments {body} }}'
# => {"data"=>{"post"=>{"id"=>"2", "title"=>"test post 2", "comments"=>[{"body"=>"Yep, sure is."}, {"body"=>"Still gotta figure out that reducing executor though"}]}}}
```

```
$ bundle exec ruby cli.rb 'mutation { createPost(title: "new post!", body: "new post body"){ body, title } }'
# {"data"=>{"createPost"=>{"body"=>"new post body", "title"=>"new post!"}}}
```

```
$ bundle exec ruby cli.rb 'mutation { createComment(post_id: 1, body: "new post body"){ post{body, comments{body}} } }'
# {"data"=>{"createComment"=>{"post"=>{"body"=>"this is graphql on ruby!", "comments"=>[{"body"=>"new post body"}]}}}}
```
