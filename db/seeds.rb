# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

LTweet.delete_all

file = File.new("db/data/tweets.txt","r");
count = 1;
while (line = file.gets)
  


  message =line; 
  puts message
  LTweet.create(
         :tid => count,
         :title => message,
         :message =>message

         )
  count = count+1;
end
LTweet.create(
:tid => 1,
:title => 'Deaths in Lahore factory collapse',
:message =>'An illegal medicine factory collapses in the eastern Pakistani city of Lahore, killing at least nine people, including women and children, officials say.',
:post_date => DateTime.civil_from_format(:local, 2012, 2, 1)
)


LTweet.create(
:tid => 2,
:title => 'China in EU carbon scheme ban',
:message =>'China tells its airlines not to pay charges to the EU\'s Emissions Trading Scheme, aimed at cutting carbon emissions.',
:post_date => DateTime.civil_from_format(:local, 2012, 2, 1)
)


LTweet.create(
:tid => 3,
:title => 'US tightens Iran bank sanctions',
:message =>'US President Barack Obama places new sanctions on Iran, blocking government assets held in the US, including the Iranian Central Bank.',
:post_date => DateTime.civil_from_format(:local, 2012, 2, 1)
)

LTweet.create(
:tid => 4,
:title => 'Egypt \'to try foreign NGO staff\'',


:message =>'China tells its airlines not to pay charges to the EU\'s Emissions Trading Scheme, aimed at cutting carbon emissions.',
:post_date => DateTime.civil_from_format(:local, 2012, 2, 1)
)

LTweet.create(
:tid => 5,
:title => 'Gas price rises as freeze bites',
:message =>'Gas price rises as freeze bites',
:post_date => DateTime.civil_from_format(:local, 2012, 2, 1)
)
