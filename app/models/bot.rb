class Bot < ActiveRecord::Base
	 def self.search_words number, words
	 	CLIENT.search(words, lang: "en").take(number).each{|t|
	 		User.create(name: t.user.screen_name, tweet_id: t.id.to_s, tweet: t.text)
	 		CLIENT.update(Bot.respond(t.user.screen_name), in_reply_to_status_id: t.id)
	 	} 
	 end

	  def self.respond name 
	  	"@" + name + " " + Response.offset(rand(Response.count)).message 
	  end 
end
