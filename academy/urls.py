from django.urls import path
from .views import BackendPageView
from academy.models import Lessons


from . import views
urlpatterns = [
    path('', views.main, name='main'),
    path('skils/<int:pk>',views.skils, name='skils'),
    path('register', views.register, name="register"),
    path('teachers/<int:pk>', views.teachers, name="teachers"),
    path('lessons/<int:pk>',views.lessons, name='lessons'),
    path('checkTasks', views.checktasks, name="task"),
    path('backend/', BackendPageView, name='backend'),

]
