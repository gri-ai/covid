#!/usr/bin/env python

"""
WSGI config for chatbot project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/howto/deployment/wsgi/
"""

import os
import sys

from django.core.wsgi import get_wsgi_application
root = os.path.join(os.path.dirname(__file__), '..')
sys.path.insert(0, root)

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'chatbot.settings')

application = get_wsgi_application()

# def application(environ, start_response):
#     status = '200 '
#     output = 'Hello world'

#     response_headers = [
#         ('Content-type', 'text/plain'),
#         ('Content-Length', str(len(output)))
#     ]

#     start_response(status, response_headers)
#     return [output]