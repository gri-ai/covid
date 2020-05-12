import datetime
from django.core import exceptions
from .models import user, chat_session

class contact:

    @staticmethod
    def get_contact_by_id(id):
        r"""
        :param id:
            dabase id
        """

        return user.objects.get(pk=id)

    def get_contact_by_crm_ref(self, crm_ref):
        r"""
        :param crm_ref:
            CRM Contact No
        """

        return user.object.get(crm_ref=crm_ref)

    def get_contact_by_agent_ref(self, agent_ref):
        r"""
        :param agent_ref:
            Another unique reference number.
        """

        return user.object.get(agent_ref=agent_ref)

    def create(self, name, last_name, phone, crm_ref, agent_ref=None):
        r"""Creates new user.
        :param name:
            Name
        :param last_name:
            Last Name
        :param phone:
            Contact Phone Number
        :param crm_ref:
            CRM Reference or Contact Number
        :param agent_ref:
            Another back-end reference
        """
        # :param \*\*kwargs:
        #     See below
        # :Keyword Arguments:
        #     * *first_name* (''str'') --
        #         Name
        #     * *last_name* (''str'') --
        #         Last name
        #     * *phone* (''str'') --
        #         Contact Phone Number
        #     * *crm_ref* (''str'') --
        #         CRM Reference or Contact Number
        #     * *agent_ref* (''str'') --
        #         Another back-end reference
        u = user()
        try:
            u.name = name
            u.last_name = last_name
            u.phone = phone
            u.crm_ref = crm_ref
            u.agent_ref = agent_ref
            u.save()
        except Exception as e:
            print(e)
            return -1

        return u.id
        
    def update_by_crm_ref(self, crm_ref, name, last_name, phone, agent_ref):
        r"""Creates new user.
        :param name:
            Name
        :param last_name:
            Last Name
        :param phone:
            Contact Phone Number
        :param crm_ref:
            CRM Reference or Contact Number
        :param agent_ref:
            Another back-end reference
        """
        # :param \*\*kwargs:
        #     See below
        # :Keyword Arguments:
        #     * *first_name* (''str'') --
        #         Name
        #     * *last_name* (''str'') --
        #         Last name
        #     * *phone* (''str'') --
        #         Contact Phone Number
        #     * *crm_ref* (''str'') --
        #         CRM Reference or Contact Number
        #     * *agent_ref* (''str'') --
        #         Another back-end reference
        u = self.get_contact_by_crm_ref(crm_ref)
        if u is None:
            print('Contact not found')
            return 0

        try:
            u.name = name
            u.last_name = last_name
            u.phone = phone
            u.agent_ref = agent_ref
            u.save()
        except Exception as e:
            print(e)
            return -1

        return u.id

    def update_by_id(self, id, name, last_name, phone, agent_ref,crm_ref):
        r"""Creates new user.
        :param id:
            Database Id
        :param name:
            Name
        :param last_name:
            Last Name
        :param phone:
            Contact Phone Number
        :param crm_ref:
            CRM Reference or Contact Number
        :param agent_ref:
            Another back-end reference
        """
        # :param \*\*kwargs:
        #     See below
        # :Keyword Arguments:
        #     * *first_name* (''str'') --
        #         Name
        #     * *last_name* (''str'') --
        #         Last name
        #     * *phone* (''str'') --
        #         Contact Phone Number
        #     * *crm_ref* (''str'') --
        #         CRM Reference or Contact Number
        #     * *agent_ref* (''str'') --
        #         Another back-end reference
        u = self.get_contact_by_id(id)
        if u is None:
            print('Contact not found')
            return 0

        try:
            u.name = name
            u.last_name = last_name
            u.phone = phone
            u.crm_ref = crm_ref
            u.agent_ref = agent_ref
            u.save()
        except Exception as e:
            print(e)
            return -1

        return u.id

   
    
    def dispose_session_context(self, session_id):

        cntx = self.get_user_session_context(session_id)
        if cntx is None:
            print('No active context')
            return 1

        cntx.date_dismissed = datetime.datetime.now()

        try:
            cntx.save()
        except Exception as e:
            return -1
            
        
        return 1