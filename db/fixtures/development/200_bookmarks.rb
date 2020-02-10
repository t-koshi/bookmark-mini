# URLの集め方
# doc = Nokogiri::HTML(open('URL入れる'))
# doc.xpath('//a/@href').select {|url| URI::regexp(%w(http https)) === url}

lines = File.readlines(Rails.root.join("db/fixtures/#{Rails.env}/urls.txt"))
User.all.each do |user|
  p "user: #{user.id}"
  comment = "test comment by #{user.name}"
  lines.sample(10).each do |url|
    wr = WebResource::FindOrCreateService.run!(url: url)
    bookmark = Bookmark::FindOrInitializeService.run!(user: user, web_resource: wr)
    bookmark.comment = comment
    bookmark.save
  end
end

WebResource.all.each do |web_resource|
  WebResource::UpdateUsersCountService.run!(web_resource: web_resource)
end
