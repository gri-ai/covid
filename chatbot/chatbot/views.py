import requests
import dialogflow_v2 as dialogflow
#import google.protobuf  as pf
import configparser
import json
import uuid
from datetime import datetime, timedelta

from django.utils import timezone
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from .models import response_hook, response
from .forms import messageform
from .modules import Covo, Singleton
from .contact import contact
from .session import session
from google.protobuf.json_format import MessageToDict, MessageToJson
from random import randint
import os 

work_path = os.getcwd()

def index(request):
    return render(request, 'chatbot.html', context= {})

def get_session(session_id=None):
    
    if session.is_session_exists(session_id):        
        return session_id
    
    session_id = create_session(session_id)    

    return session_id

def create_session(session_id = None):
    id = session.create_session(session_id)
    return id


def clear_session(session_id):
    print("session cleared")
    session.set_last_touch(session_id, datetime.now())


def dflow(request):

    if request.session.get('has_session', False) == False:
        request.session['has_session'] = True
        session_id = create_session()
        request.session['session_id'] = session_id

    session_id = request.session.get('session_id')

    if request.method == 'POST':
        form  = messageform(request.POST)
        if form.is_valid():
            ask_dflow_resp = ask_dflow(form.cleaned_data['message'], session_id)
            default_response = get_response(session_id, ask_dflow_resp)

            return JsonResponse({'status':'true','response':str(default_response)}, status=200)


    return JsonResponse({'status':'false','response':'default'}, status=500)

def ask_dflow(message, session_id):
    session_client = dialogflow.SessionsClient.from_service_account_json(os.path.join(work_path, "covo-d-dialog-flow.json"))
    session = session_client.session_path(PROJECT_ID, session_id)

    query_input = dialogflow.types.QueryInput(
        text = dialogflow.types.TextInput(
            text = message, language_code = 'en'
            )
        )

    return session_client.detect_intent(session=session, query_input=query_input)

def get_response(session_id, response):

    response_name = action_type = None
    try:
        action = response_hook.objects.get(action_name=response.query_result.action)
        response_name = action.response
        action_type = action.action_type
    except Exception as e:
        pass 
    
    if action_type == "text":
        return response.objects.get(response_key=response_name).default_response
    else:
        single = Covo.get_instance()
        action = response.query_result.action.split('_')

        if action[0] not in single.modules.keys():
            return response.query_result.fulfillment_text #Module not exists!
        else:
            return single.run(session_id, response)

with open('{}/chatbot/chatbot/config.json'.format(work_path), 'r') as f:
    config = json.load(f)

APP_ID = config['DEFAULT']['APP_ID'] 
SERVER_ACCESS_TOKEN = config['DEFAULT']['SERVER_ACCESS_TOKEN'] 
PROJECT_ID = config['DIALOGFLOW']['PROJECT_ID'] 