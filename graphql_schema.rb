PostType = GraphQL::ObjectType.define do
  name "Post"
  description "A blog entry"

  field :id, !types.ID, "The unique ID for this post"
  field :title, !types.String, "The title of this post"
  field :body, !types.String,  "The body of this post"
end

QueryRoot = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"

  field :post do
    type PostType
    description "Find a Post by id"
    argument :id, !types.ID
    resolve -> (object, arguments, context) {
      Post.find(arguments["id"])
    }
  end
end
