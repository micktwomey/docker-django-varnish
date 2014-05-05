docker-django-varnish
=====================

Varnish frontend for a typical Django site.

To run:

    docker run --rm -t -i --link myapp:backend -p 6081:6081 micktwomey/django-varnish

Currently this is a straight HTTP proxy for a backend listening on port 8000 (link as backend).

There are some specifics for django-isms:

- /admin
- /static
