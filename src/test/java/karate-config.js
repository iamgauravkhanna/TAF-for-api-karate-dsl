function defineConfigurations() {

	var env = karate.env;

	karate.log('karate.env system property was:', env);

	if (!env) {
		env = 'dev';
	}

	var config = { // base config JSON
		appId: 'admin',
		appSecret: 'password123',
		baseUrl: 'https://restful-booker.herokuapp.com',
	};

	karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000);
	karate.configure('logPrettyRequest', false);
	karate.configure('logPrettyResponse', false);
	karate.configure('report', { showLog: true, showAllSteps: false });
	karate.configure('responseHeaders', { 'Content-Type': 'application/json', Accept: 'application/json' });
	return config;
}