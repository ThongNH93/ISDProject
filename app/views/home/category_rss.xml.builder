
xml.instruct! :xml, :version=>"1.0"
xml.rss :version => '2.0' do
  if @articles.present?
    xml.channel do
      xml.title @category.name + ' - Daily News - Dailynews.com'
      xml.link home_articles_url(@category.id)

      @articles.each do |article|
        xml.item do
          xml.title article.title
          xml.description article.description
          xml.link home_article_url(article)
          xml.image article.image
          xml.author article.author
          xml.pubDate article.created_at.to_s(:rfc822)
        end
      end
    end
  end
  if @blogs.present?
    xml.channel do
      xml.title 'Blogs' + ' - Daily News - Dailynews.com'
      xml.link home_blogs_url

      @blogs.each do |blog|
        xml.item do
          xml.title blog.title
          xml.description blog.description
          xml.link home_blog_url(blog)
          xml.image blog.image
          xml.author blog.author
          xml.pubDate blog.created_at.to_s(:rfc822)
        end
      end
    end
  end
end