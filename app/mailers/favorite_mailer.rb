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
end
