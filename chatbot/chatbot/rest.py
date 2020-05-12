import requests

from django.http import JsonResponse, JsonResponse
from django.shortcuts import render



def api(request, phone, message, agent):
    return JsonResponse({'p': phone, 'm':message})