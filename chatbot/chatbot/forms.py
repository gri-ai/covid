from django import forms

class messageform(forms.Form):
    message = forms.CharField(label='message', max_length=200)
    csrfmiddlewaretoken = forms.CharField(label='csrfmiddlewaretoken', max_length=200)
