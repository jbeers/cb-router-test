# Purpose

This repo is meant to demonstrate an issue I'm having with the coldbox router. Per the documentation I expect to be able to pass a domain into the options of the group function and have it applied to the routes within. This doesn't appear to be working.


To test
* Add the following entries to your hosts file
    * `127.0.01 cb-router-test.com`
    * `127.0.01 a.cb-router-test.com`
    * `127.0.01 b.cb-router-test.com`
* Use `docker run --rm -p 8080:8080 -v /path/to/repo:/app ortussolutions/commandbox` to run
* Check out config/router.cfc for an explanation of what configuration works and what doesn't

# Possible Solution

After a bit of digging I found the following in `coldbox/system/web/routing/Router.cfc`

```
// this is in addRoute() 
if ( !variables.withClosure.isEmpty() && !variables.onGroup ) {
    processWith( arguments );
}
```

I'm not sure how this would impact the system as a whole but I think that the `!variables.onGroup` is misplaced as it will always supress the options when using a group to configure the routes.