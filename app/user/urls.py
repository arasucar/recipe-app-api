"""
URL mappings for the user API.
"""
from django.urls import path

from . import views


app_name = 'user'

urlpatterns = [
    path('crate/', views.CreateUserView.as_view(), name='create')
]

