
from django.shortcuts import render
from django.http import HttpResponse
from .models import *
from .forms import AcademyUsersForms
from django.views.generic import TemplateView


    

def BackendPageView(request):
    
    return render(request, 'academy/backend.html')
    

def main(request):
    query = CategoriesModel.objects.all()
    query2 = TeachersModel.objects.all()
    content = { 'category' : query, 'teachers' : query2 , 'title' : "Main Page" }
    return render(request,'academy/main.html', content)

def skils(request,pk):
    query = Skill_names.objects.filter(category_id = pk)
    content = { 'skils' : query, 'title' : "Skils Page" }
    return render(request,'academy/skils.html', content)

def teachers(request,pk):
    query = TeachersModel.objects.filter(teacher_id = pk)
    content = { 'teacher' : query, 'title' : "Teacher Page" }
    return render(request,'academy/skilss.html', content)

def lessons(request,pk):
    query = Lessons.objects.filter(skill_id = pk)
    content = { 'lessons' : query, 'title' : "Lesson Page" }
    return render(request,'academy/lessons.html', content)

def register(request):
    form = AcademyUsersForms
    viloyat = Regions.objects.all()
    content = {'viloyat' : viloyat, 'forms' : form}
    return render(request, 'academy/register.html', content)

def checktasks(request):
    query_lesson = Lessons.objects.all()
    query  = LinkasModel.objects.all()
    content = {'lessons':query_lesson, 'tasks' : query, 'title' : 'Home works!', 'thead' : ["O'quvchi", "Darsning nomi","Masalani yechimi", "Vazifani to'g'ri javobi","Script","Status"]}
    return render(request, 'academy/tasks.html', content)

