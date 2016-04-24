PostType = GraphQL::ObjectType.define do
  name "Post"
  description "A blog entry"

  field :id, !types.ID, "The unique ID for this post"
  field :title, !types.String, "The title of this post"
  field :body, !types.String,  "The body of this post"
  field :comments, -> { !types[!CommentType] }, "Responses to this post"
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

CommentType = GraphQL::ObjectType.define do
  name "Comment"
  description "A reply to a post"

  field :id, !types.ID, "The unique ID of this comment"
  field :body, !types.String, "The content of this comment"
  field :post, !PostType, "The post this comment replies to"
end

MutationRoot = GraphQL::ObjectType.define do
  name 'Mutation'
  description 'The root for mutations in this schema'
  field :createPost do
    type PostType
    description 'Create a post'
    argument :title, !types.String
    argument :body, !types.String
    resolve -> (object, arguments, context) {
      Post.create(title: arguments[:title], body: arguments[:body])
    }
  end
end

