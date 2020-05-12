from .singleton import Singleton

class Covo:
    module_dict = {}

    def register(self, obj):
        name = str(obj)
        if name in self.module_dict.keys():
            raise ValueError("Module {} already exists!".format(name))

        self.module_dict[name] = obj

    def run(self, session_id, response):
        action = response.query_result.action.split('_')
        return self.module_dict.get(action[0]).run(session_id, response) #get method can get default value as well.

    def __add__(self, obj):
        self.register(obj)

    @staticmethod
    def get_instance():
        return Singleton(Covo())

    @property
    def modules(self):
        return self.module_dict