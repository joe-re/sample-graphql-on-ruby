Post.create!(title: 'test post 1', body: 'this is graphql on ruby!')
post2 = Post.create!(title: 'test post 2', body: 'graphql is nice!')
post2.comments.create!(body: 'Yep, sure is.')
post2.comments.create!(body: 'Still gotta figure out that reducing executor though')
