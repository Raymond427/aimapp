# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
niner_nights = News.create( title: 'Niner Nights', date: 'Summer 2014' ,thumburl: 'https://d1q9wbuypc40mm.cloudfront.net/qcb575tusx9el2h.jpg', description: 'Come out to visit the AIM booth during Niner Nights on the UNC Charlotte campus! future freshman signed AIM\'s door to "open your door from dreams to reality!"')
ray = Member.create( first_name: 'Raymond', last_name: 'Ferrell', major: 'Computer Science', graduation_date: 'Dec 2016', thumb_url: 'https://d1q9wbuypc40mm.cloudfront.net/cbh6u36l6mmg7md.jpg', linkedin_url: 'http://www.linkedin.com/pub/raymond-ferrell/78/263/a61', email: 'aimunccvicepresident@gmail.com', is_executive: true, executive_position: 'President')
