class FavoriteMailer < ApplicationMailer
  default from: "megan@megan-and-andy.co.uk"

  def new_comment(user, post, comment)

     headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"

     @user = user
     @post = post
     @comment = comment

     mail(to: user.email, cc: 'megan@megan-and-andy.co.uk', bcc: 'megan.wilkin@blueostrichdesign.co.uk', subject: "New comment on #{post.title}")
   end

   def new_post(post)
     headers["Message-ID"] = "<posts/#{post.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"

     @post = post

     mail(to: post.user.email, cc: 'megan.wilkin@blueostrichdesign.co.uk', subject: "You are now following #{post.title}")
   end
end
