from django.db import models
import datetime
from django.db.models.deletion import CASCADE
from django.utils import timezone


# Viloyat
class Regions(models.Model):
    
    region_name = models.CharField(max_length = 30, verbose_name='Viloyat nomi:')
    
    class Meta:
        verbose_name        = 'Viloyat nomi'
        verbose_name_plural = 'Viloyatlar nomi'

    def __str__(self):
        return self.region_name


# Tuman
class Districts(models.Model):
    
    region        = models.ForeignKey(Regions, on_delete=models.CASCADE, default=1)
    district_name = models.CharField(max_length = 30, verbose_name='Tuman nomi:')
    
    class Meta:
        verbose_name        = 'Tuman nomi'
        verbose_name_plural = 'Tumanlar nomi'

    def __str__(self):
        return self.district_name
   

#  Users
class AcademyUsers(models.Model):
    
    username     = models.CharField(max_length=255)
    firstname    = models.CharField(max_length=30, verbose_name = 'Foydalanuvchi ismi:')
    lastname     = models.CharField(max_length=40, verbose_name = 'Foydalanuvchi familiyasi:')
    age          = models.IntegerField(verbose_name = 'Yoshi:')
    phone        = models.IntegerField('Telefon raqam:')
    district     = models.ForeignKey(Regions, on_delete = models.CASCADE, verbose_name = 'Viloyatni tanlang:')   
    image        = models.ImageField(upload_to='users/')
    email        = models.EmailField(max_length=40, verbose_name='email.com', null=True)
    
    class Meta:
        verbose_name        = 'Foydalanuvchi'
        verbose_name_plural = 'Foydalanuvchilar'

    def __str__(self):
        return self.username

class CategoriesModel(models.Model):

    CategoryName = models.CharField(max_length=100)
    image        = models.ImageField(upload_to='category/')
    description  = models.TextField(default="Description")
    status       = models.BooleanField(default=False)


    class Meta:
        verbose_name        = 'Kategoriya'
        verbose_name_plural = "Kategoriyalar ro'yxati"
    
    def __str__(self):
        return self.CategoryName

#  Skills
class Skill_names(models.Model):
    category           = models.ForeignKey(CategoriesModel, on_delete=models.CASCADE, default=1)
    skill_format       = models.BooleanField(default=False, verbose_name="kurs holati active yoki disabled")
    skill_type         = models.BooleanField(default=False, verbose_name="kurs offline yoki online ligi") 
    skill_name         = models.CharField(verbose_name='Kurs nomi', max_length=70)
    description        = models.TextField(verbose_name="www", default="description")
    course_start_date  = models.DateField(default=datetime.date.today, verbose_name = 'Kurs boshlanish sanasi')
    course_finish_date = models.DateField(default=datetime.date.today, verbose_name = 'Kurs tugash sanasi')   
    course_duration    = models.IntegerField('Kursni davomiyligi oyda')
    skill_image        = models.ImageField(upload_to='skills/')
    
    
    class Meta:
        verbose_name        = 'Kurs nomi'
        verbose_name_plural = 'Kurs nomlari'

    def __str__(self):
        return str(self.category)+'.'+ self.skill_name
   
  
# Comments
class Comments(models.Model):
    
    user        = models.ForeignKey(AcademyUsers, on_delete = models.CASCADE, verbose_name = 'Foydalanuvchi')
    skill_name  = models.ForeignKey(Skill_names, on_delete = models.CASCADE, verbose_name = 'Kurslarimiz')
    description = models.TextField( ) 
    data        = models.DateTimeField(auto_now = False , auto_now_add = False, verbose_name = 'Sanasi va vaqti:')

    class Meta:
        verbose_name        = 'Izoh'
        verbose_name_plural = 'Izohlar'

    def __str__(self):
        return self.skill_name

# teachers 
class TeachersModel(models.Model):
    
    skill        = models.ManyToManyField(Skill_names)
    teacherName  = models.CharField(max_length=255)
    image        = models.ImageField(upload_to="teachers/")
    description  = models.TextField()
    start        = models.IntegerField(default=0)


    class Meta:
        verbose_name = "O'qituvchi"
        verbose_name_plural  = "O'qituvchilar ro'yxati"


    def __str__(self):
        return self.teacherName 


# Lesson
class Lessons(models.Model):
    
    skill         = models.ForeignKey(Skill_names, on_delete = models.CASCADE)
    teacher       = models.ForeignKey(TeachersModel, on_delete = models.CASCADE, verbose_name = "O'qituvchi") 
    date          = models.DateTimeField(verbose_name='Registratsiya sanasi:', default=datetime.datetime.today())
    lesson_name   = models.CharField(max_length=255)    
    image         = models.ImageField(upload_to="static/media/lessons")
    accsess       = models.BooleanField(default=False)
    
    class Meta:
        verbose_name        = 'Dars'
        verbose_name_plural = 'Darslar'
        
    def __str__(self):
        return (self.lesson_name)
    
class LinkasModel(models.Model):
    
    lesson    = models.ForeignKey(Lessons, on_delete=models.CASCADE)
    users     = models.ForeignKey(AcademyUsers, on_delete=models.CASCADE)
    pdf       = models.CharField(max_length=100)
    video     = models.CharField(max_length=100)
    task      = models.TextField()
    trainData = models.TextField()
    script    = models.CharField(max_length=200)



    class Meta:
        verbose_name    = "Havola"
        verbose_name_plural = "Havolalar ro'yxati"


    def __str__(self):
        return str(self.lesson)

