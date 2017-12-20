class OtherServiceCall
 def api_call(title)
 	
 	@title= title.split(' ').join('_')
 	@url = "http://www.omdbapi.com/?i=tt3896198&apikey=299ccb30"

 end
end
