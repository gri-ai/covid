from datetime import datetime, timedelta
from django.conf import settings
from django.contrib import auth


class AutoLogout:

  def __init__(self, get_response):
      self.get_response = get_response
      # One-time configuration and initialization.

  def __call__(self, request):

    try:

      if datetime.now() - request.session['last_touch'] > timedelta( 0, settings.AUTO_LOGOUT_DELAY * 60, 0):
        del request.session['last_touch']
        del request.session['has_session']

    except Exception as e:
      pass

    request.session['last_touch'] = datetime.now()

    # Code to be executed for each request before
    # the view (and later middleware) are called.

    # Code to be executed for each request/response after
    # the view is called.
    return self.get_response(request)