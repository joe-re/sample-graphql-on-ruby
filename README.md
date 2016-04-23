# sample-graphql-on-ruby

try [graphql-ruby](https://github.com/rmosolgo/graphql-ruby)

## usage

You can give graphql's query to cli.rb's argument and receive result hash.

```
$ bundle exec ruby cli.rb "{ post(id: 1) { id, title, comments {body} }}"
# => {"data"=>{"post"=>{"id"=>"1", "title"=>"test post 1", "comments"=>[]}}}
```
```
$ bundle exec ruby cli.rb "{ post(id: 2) { id, title, comments {body} }}"
# => {"data"=>{"post"=>{"id"=>"2", "title"=>"test post 2", "comments"=>[{"body"=>"Yep, sure is."}, {"body"=>"Still gotta figure out that reducing executor though"}]}}}
```
