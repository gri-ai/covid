from datetime import datetime, timedelta
from django.utils import timezone
import uuid
from .models import intent, user, chat_session, intent_parameter
from django.db import transaction


class session():

    @staticmethod
    @transaction.atomic
    def create_session(session_id=None):
        if session_id is None:
            session_id = str(uuid.uuid4())
        now = timezone.now()
        sess =  chat_session()
        sess.user = None
        sess.session_id = session_id
        sess.active_intent = None
        sess.date_created = now
        sess.date_dismissed = now + timedelta(seconds=600)
        try:
            sess.save()
            return session_id
        except Exception as e:
            #log e
            print(e)
            raise
    
    @staticmethod
    def is_session_exists(session_id):
        sess = session.get_session_context(session_id)
        if sess is None:
            return False

        date_dismissed = sess.date_dismissed if sess.date_dismissed is not None else timezone.now()
        if timezone.now() - date_dismissed > timedelta( 0, 1 * 60, 0) or sess.date_dismissed is None:
            return False

        return True

    @staticmethod
    def get_session_context(session_id): 
        try:
            return chat_session.objects.filter(session_id=session_id).first()
        except Exception as e:
            print(e) #TODO: Log expection
            raise
        
        return -1

    @staticmethod
    def set_last_touch(session_id, date_dismissed = None):

        sess = session.get_session_context(session_id)
        if sess is not None:
            if date_dismissed is None:
                date_dismissed = timezone.now() + 100
            sess.date_dismissed = date_dismissed
            sess.save()

    @staticmethod
    def create_intent(sess, intent_name):
        now = timezone.now()
        sess_intent = intent()
        sess_intent.intent_name = intent_name
        sess_intent.date_created = now
        sess_intent.session = sess 
        sess_intent.save()
        return sess_intent

    @staticmethod
    def get_life_parameter(intent_name, key):

        return 5, 1000

    @staticmethod
    def read_intent_object(sess, intent_name):
        return intent.objects.filter(session__session_id=sess, intent_name=intent_name, date_dismissed=None).first()


    @staticmethod
    @transaction.atomic
    def create_intent_with_parameters(session_id, intent_name, **kwargs):
        intent_obj = session.read_intent_object(session_id, intent_name)
        if intent_obj is None:
            sess = session.get_session_context(session_id)
            intent_obj = session.create_intent(sess, intent_name)

        session.create_intent_parameters(intent_obj, **kwargs)

    @staticmethod    
    def create_intent_parameters(intent_obj, **kwargs):

        for key, value in kwargs.items():
            life_span, life_span_time = session.get_life_parameter(intent_obj.intent_name, key)
            expiry_date = session.get_expiry_date(life_span_time)
            session.create_intent_parameter(intent_obj, key, value, life_span, expiry_date)


    @staticmethod
    def get_expiry_date(time_span):
        time_d = timedelta(minutes=time_span)
        return timezone.now() + time_d

    @staticmethod
    def create_intent_parameter(intent_obj, key, value, life_span, expiry_date):
        param = intent_parameter.objects.filter(intent=intent_obj, parameter_key = key).first()
        if param is None:
            param = intent_parameter()
            param.intent = intent_obj
            param.parameter_key = key
        
        param.parameter_value = value
        param.life_span = life_span
        param.expire_date = expiry_date
        param.save()

    
    @staticmethod
    def read_intent_parameters(session_id, intent_name):

        now = timezone.now()
        intents = intent.objects.filter(session__session_id=session_id, date_dismissed=None).values()
        parameters = intent_parameter.objects.filter(intent__intent_name=intent_name, intent__session__session_id=session_id).values()
        ret =  [{'intent_name':i['intent_name'], 'parameters': [{p['parameter_key']:p['parameter_value'] for p in parameters }] } for i in intents if i['date_dismissed'] is None]         #, status  in intents if status=='A']
        return ret

    @staticmethod
    def read_session_parameters(session_id):

        now = timezone.now()
        # sess = chat_session.objects.get(session_id=session_id)
        intents = intent.objects.filter(session__session_id=session_id, date_dismissed=None).values()
        parameters = intent_parameter.objects.filter(intent__session__session_id=session_id).values()
        ret =  [{'intent_name':i['intent_name'], 'parameters': [{p['parameter_key']:p['parameter_value'] for p in parameters if i['id'] == p['intent_id'] }] } for i in intents if i['date_dismissed'] is None]         #, status  in intents if status=='A']
        return ret

    @staticmethod
    def read_session_parameter(session_id, key):
        param = intent_parameter.objects.filter(intent__session__session_id=session_id, parameter_key=key).first()
        if param is None:
            return ''

        return param.parameter_value

    @staticmethod
    def read_active_intent(session_id):
        return chat_session.objects.filter(session_id=session_id).first().active_intent

    @staticmethod
    def reduce_parameter_life_span(session_id):
        sess = chat_session.objects.filter(session_id=session_id).first()
        intents = intent.objects.filter(session=sess)
        for intent_obj in intents: 
            params = intent_parameter.objects.filter(intent=intent_obj, life_span__gte=1)
            for param in params:
                param.life_span -= 1
                param.save()
