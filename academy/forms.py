from django import forms
from django.db.models.base import Model
from django.forms import TextInput,NumberInput,EmailInput
from django.forms.widgets import Input
from .models import AcademyUsers, LinkasModel

class AcademyUsersForms(forms.ModelForm):
    
        my_widgets = {
            "username" : TextInput(attrs={
                'class'       : 'input',
                'type'        : 'text',
                'placeholder' : 'username',
                'name'        : 'username',
                'id'          : 'username',
            }),

            "firstname" : TextInput(attrs={
                'class'       : 'input',
                'type'        : 'text',
                'placeholder' : 'firtname',
                'name'        : 'firtname',
                'id'          : 'firtname',
            }),

             "lastname" : TextInput(attrs={
                'class'       : 'input',
                'type'        : 'text',
                'placeholder' : 'lastname',
                'name'        : 'lastname',
                'id'          : 'lastname',
            }),

            "phone" : NumberInput(attrs={
                'class'       : 'input',
                'type'        : 'number',
                'placeholder' : 'phone',
                'name'        : 'phone',
                'id'          : 'phone',
            }),

            "age" : NumberInput(attrs={
                'class'       : 'input',
                'type'        : 'number',
                'placeholder' : 'age',
                'name'        : 'age',
                'id'          : 'age',
            }),

            "phone" : NumberInput(attrs={
                'class'       : 'input',
                'type'        : 'number',
                'placeholder' : 'age',
                'name'        : 'age',
                'id'          : 'age',
            }),

            "email" : EmailInput(attrs={
                'class'       : 'input',
                'type'        : 'text',
                'placeholder' : 'email',
                'name'        : 'email',
                'id'          : 'email',
            }),
        }

        username  = forms.CharField(widget  = my_widgets['username'])
        firstname = forms.CharField(widget  = my_widgets['firstname'])
        lastname  = forms.CharField(widget  = my_widgets['lastname'])
        age       = forms.CharField(widget  = my_widgets['age'])
        phone     = forms.CharField(widget  = my_widgets['phone'])
        email     = forms.EmailField(widget = my_widgets['email'])

        class Meta: 
            model = AcademyUsers
            fields = [ 'username', 'firstname', 'lastname', 'age', 'phone', 'email' ]
            
class MyTasksForm(forms.ModelForm):
    
    class Meta: 
        model = LinkasModel
        fields = ["trainData","task","script"]
