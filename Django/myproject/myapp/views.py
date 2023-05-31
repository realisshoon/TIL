from django.shortcuts import render,HttpResponse
import random
# Create your views here.



def index(request):
    return HttpResponse('''
    <html>
    <body>
        <h1>Django</h1>
        <ol>
            <li>routing</li>
            <li>view</li>
            <li>model</li>
        </ol>
        <h2>Welcome</h2>
        Hello, Django
    </body>
    </html>
    ''')

def create(request):
    return HttpResponse('Create')

def read(request,id):
    return HttpResponse('Read'+id)