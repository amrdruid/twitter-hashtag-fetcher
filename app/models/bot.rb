class Bot < ActiveRecord::Base
	 def self.search_words number, words
	 	CLIENT.search(words, lang: "en").take(number).each{|t|
	 		User.create(name: t.user.screen_name, tweet_id: t.id.to_s, tweet: t.text)
	 	} 
	 end 
end
