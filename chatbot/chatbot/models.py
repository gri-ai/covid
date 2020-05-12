from django.db import models
import uuid


status_types = (
    ('A', 'Active'),
    ('P', 'Passive')
)

class response(models.Model):
    response_key = models.CharField(max_length = 50)
    default_response = models.CharField(max_length = 400)
    date_created = models.DateTimeField()
    date_updated = models.DateTimeField()

class alternative_response(models.Model):
    response = models.ForeignKey(response,models.CASCADE,blank=True,null=True)
    response = models.CharField(max_length = 400)
    date_created = models.DateTimeField()
    date_updated = models.DateTimeField()


class user(models.Model):
    name = models.CharField(max_length=60)
    last_name = models.CharField(max_length=30)
    phone = models.CharField(max_length=14)
    crm_ref = models.CharField(max_length=13)
    agent_ref = models.CharField(max_length=13)
    date_created = models.DateTimeField()
    date_last_login = models.DateTimeField()
    date_updated = models.DateTimeField()

class chat_session(models.Model):
    user = models.ForeignKey(user,models.CASCADE,blank=True,null=True)
    session_id = models.CharField(max_length = 36, default=uuid.uuid4, editable=False)
    active_intent = models.CharField(max_length=30, null=True)
    date_created = models.DateTimeField()
    date_dismissed = models.DateTimeField(null=True)

class intent(models.Model):

    session = models.ForeignKey(chat_session, models.CASCADE, blank=True, null=True)
    intent_name = models.CharField(max_length=30)
    date_created = models.DateTimeField()
    date_dismissed = models.DateTimeField(null=True)
    status = models.CharField(max_length = 1, choices = status_types, default = 'A')

class intent_parameter(models.Model):

    intent = models.ForeignKey(intent, models.CASCADE, blank=True, null=True)
    parameter_key = models.CharField(max_length=30)
    parameter_value = models.CharField(max_length=100)
    life_span = models.IntegerField(null=False)
    expire_date = models.DateTimeField(null=True)
    status = models.CharField(max_length = 1, choices = status_types, default = 'A')

class response_hook(models.Model):
    response_hook_types = (
        ('rest', 'Rest Call'),
        ('rpc', 'Procedure Call'),
        ('txt', 'Text Response'),
    )

    action_name = models.CharField(max_length = 50)
    action_type = models.CharField(
        max_length = 20,
        choices = response_hook_types,
        default = 'rest'
    )
    response = models.CharField(max_length = 255) #URL, ClassName, response_key
    date_created = models.DateTimeField()
    date_updated = models.DateTimeField()
    status = models.CharField(max_length = 1, choices = status_types, default = 'A')