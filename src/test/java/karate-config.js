function fn() {

	var env = karate.env; // get java system property 'karate.env'

	karate.log('karate.env system property was:', env);

	if (!env) {
		env = 'dev'; // a custom 'intelligent' default
	}

	var config = { // base config JSON
		appId: 'admin',
		appSecret: 'password123',
		baseUrl: 'https://restful-booker.herokuapp.com',
	};

	karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000);
	karate.configure('logPrettyRequest', true);
	karate.configure('logPrettyResponse', true);
	karate.configure('report', { showLog: true, showAllSteps: false });
	karate.configure('responseHeaders', { 'Content-Type': 'application/json', Accept: 'application/json' });
	return config;
}