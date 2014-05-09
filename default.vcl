vcl 4.0;
import std;

backend default {
    .host = "::BACKEND_PORT_8000_TCP_ADDR::";
    .port = "::BACKEND_PORT_8000_TCP_PORT::";
    # .probe = {
    #     .url = "/";
    #     .interval = 5s;
    #     .timeout = 1 s;
    #     .window = 5;
    #     .threshold = 3;
    # }
}

sub vcl_recv {
    # Ignore all cookies except for /admin
    if (!(req.url ~ "^/admin/")) {
        unset req.http.Cookie;
    }

    # # Give ourself some restart time
    # set req.backend_hint = default;
    # if (! std.healthy(req.backend)) {
    #     set req.grace = 5m;
    # } else {
    #     set req.grace = 15s;
    # }
}

sub vcl_backend_response {
    # Unset any cookies for static content and cache for 1 hour
    if (bereq.url ~ "^/static/") {
        unset beresp.http.set-cookie;
        set beresp.ttl = 1h;
    }
    else {
        set beresp.ttl = 10s;
    }
    # # Add some grace for backend restarts
    # set beresp.grace = 30m;
}
