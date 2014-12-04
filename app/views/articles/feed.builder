xml.instruct! :xml, version: "1.0"
xml.rss(version: "2.0"){
  xml.channel{
    xml.title '素食星球'
    xml.link root_url
    xml.description('素食星球')
    xml.language('zh-cn')
      for article in @articles
        xml.item do
          xml.title article.title
          xml.description article.body
          xml.pubDate(article.created_at.strftime("%a, %d %b %Y %H:%M:%S %z"))
          xml.link article_url article
          xml.guid article_url article
        end
      end
  }
}
