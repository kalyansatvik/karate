function fn(){
	var config = {
		name: "Kalyan",
		baseUrl: "https://reqres.in/"
	};
	
	var env = karate.env;
	karate.log('The value of env: ', env)
	
	
	karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000);
	
	return config;
}