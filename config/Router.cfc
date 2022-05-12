component {

	function configure() {
		// Set Full Rewrites
		setFullRewrites( true );

		/**
		 * --------------------------------------------------------------------------
		 * App Routes
		 * --------------------------------------------------------------------------
		 *
		 * Here is where you can register the routes for your web application!
		 * Go get Funky!
		 *
		 */

		// A nice healthcheck route example
		route( "/healthcheck", function( event, rc, prc ) {
			return "Ok!";
		} );

		// A nice RESTFul Route example
		route( "/api/echo", function( event, rc, prc ) {
			return {
				"error" : false,
				"data"  : "Welcome to my awesome API!"
			};
		} );

		// this doesn't work
		// this shows up for both the a and b subdomains
		group( { domain: 'b' }, function(){
			route( "/test-route", function( event, rc, prc ) {
				return 'This should only appear on the "b" subdomain.';
			} );
		});

		// this works
		// this route only appears for the b subdomain
		// route( "/test-route" )
		// 	.withDomain( 'b' )
		// 	.to( 'Main.testRouteB' );

		route( "/test-route" )
			.to( 'Main.testRouteA' );

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
