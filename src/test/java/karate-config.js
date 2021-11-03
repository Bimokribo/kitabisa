function fn() {

    var env = karate.env;
    var config = {
        urlBase: 'https://reqres.in/api/users?page=2'
    };
 
 
    karate.configure('logPrettyRequest', true);
    return config;
 }
 
 