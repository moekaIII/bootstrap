class CreateMailer < ApplicationMailer
  def create_mail(blog)
    @blog = blog

    mail to:"自分のメアド", subject: "ブログ投稿の確認メール"
  end
end
