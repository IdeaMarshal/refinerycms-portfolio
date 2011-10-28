if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'portfolios').blank?
      user.plugins.create(:name => 'portfolios',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(Page)
  page = Page.create(
    :title => 'Portfolios',
    :link_url => '/portfolios',
    :deletable => false,
    :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/portfolios(\/|\/.+?|)$'
  )
  Page.default_parts.each do |default_page_part|
    page.parts.create(:title => default_page_part, :body => nil)
  end
end