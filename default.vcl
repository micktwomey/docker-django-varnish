vcl 4.0;
import std;

backend default {
    .host = "::BACKEND_PORT_8000_TCP_ADDR::";
    .port = "::BACKEND_PORT_8000_TCP_PORT::";
}
