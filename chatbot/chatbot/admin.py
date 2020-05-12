
from django.contrib import admin
from django.contrib.admin import AdminSite
from .models import *



class MyAdminSite(AdminSite):
    site_header = 'administration'

admin_site = MyAdminSite(name='botadmin')

admin_site.register(user)
admin_site.register(alternative_response)
admin_site.register(chat_session)
admin_site.register(intent)
admin_site.register(intent_parameter)
admin_site.register(response)
admin_site.register(response_hook)