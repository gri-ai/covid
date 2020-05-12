from .common import Singleton, Covo
from .models import response
import pandas as pd
import json
import random
import os
from .session import session
work_path = os.getcwd()

class symptom():

    def run(self, session_id, response):

        # find the current parameter
        intent = response.query_result.action
        action_symptom = intent.split('_')
        symptom_index = -1 if len(action_symptom) == 1 else action_symptom[1]
            

        # if current parameter is not ubtained set current checking the parameters, don't ask for symptom that is already acquired
        
        params = session.read_session_parameters(session_id)
       
        all_acquired = [int(p['intent_name']) for p in params]
        all_acquired.sort()

        not_acquired = []
        for i in range(1, 20):                
            if i not in all_acquired:
                not_acquired.append(i)

        if symptom_index == -1:
            symptom_index = not_acquired.pop(0)
        else:
            try:
                current_index = not_acquired.index(int(symptom_index))
                del not_acquired[current_index]
            except:
                pass
        
        next_symptom_index = not_acquired.pop(0)



        # check current parameter is correctly acquired

        # if parameters is not obtained correctly ask question again giving the sample (Exception-message)

        # if parameter is obtained so add the new parameter to session parameters.
        kwargs = dict(response.query_result.parameters)
        print("________________kwargs____________")
        print(kwargs)
        print(response.query_result.parameters)
        print("________________kwargs____________")
        session.create_intent_with_parameters(session_id, symptom_index, **kwargs)

        # get next question 
        df = pd.read_csv('{}/chatbot/chatbot/data/Conversation.csv'.format(work_path), header=0)
        symptom_check =  df.loc[df['Intent'] == next_symptom_index].head(1)['Message']
        if len(symptom_check.values) > 0:
            symptom_check = symptom_check.values[0]
        else:
            symptom_check = params

        return symptom_check


    def __str__(self):
        return self.__class__.__name__

Covo.get_instance() + symptom()
