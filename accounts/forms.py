from django import forms
from .signals import user_logged_in
from .models import NafdacNumber, Drug
from django.contrib.auth import get_user_model, authenticate, login

User = get_user_model()
###############   NAFDAC FORM   ###############
class DrugConfirmForm(forms.ModelForm):
    tracking_code = forms.CharField(widget = forms.TextInput(attrs = {'id':'trackingCode', 'class':'form-control', 'placeholder': 'Tracking Code'}), required = False)
    
    class Meta:
        model = Drug
        fields = ['tracking_code']
        

###############   NAFDAC FORM   ###############
class DrugUpdateForm(forms.ModelForm):
    nafdac_number = forms.CharField(widget = forms.TextInput(attrs = {'id':'NafNumber', 'class':'form-control', 'placeholder': 'NAFDAC Number', 'readonly': True, 'style': 'background-color:#e5e5e5',}), required = False)
    drug_name = forms.CharField(widget = forms.TextInput(attrs = {'id':'drugName', 'class':'form-control', 'placeholder': 'Drug Name'}), required = False)
    tracking_code = forms.CharField(widget = forms.TextInput(attrs = {'id':'trackingCode', 'class':'form-control', 'placeholder': 'Tracking Code', 'readonly': True, 'style': 'background-color:#e5e5e5',}), required = False)
    production_date = forms.CharField(widget = forms.TextInput(attrs = {'id':'productDate', 'class':'form-control', 'placeholder': 'Production Date'}), required = False)
    expiry_date = forms.CharField(widget = forms.TextInput(attrs = {'id':'expireDate', 'class':'form-control', 'placeholder': 'Expiry Date'}), required = False)
    batch_number = forms.CharField(widget = forms.TextInput(attrs = {'id':'batchNumber', 'class':'form-control', 'placeholder': 'Batch Number'}), required = False)
    
    class Meta:
        model = Drug
        fields = ['drug_name','production_date', 'expiry_date', 'batch_number', 'tracking_code']
    
###############   NAFDAC FORM   ###############
class DrugForm(forms.Form):
    nafdac_number = forms.CharField(widget = forms.TextInput(attrs = {'id':'NafNumber', 'class':'form-control', 'placeholder': 'NAFDAC Number', 'readonly': True, 'style': 'background-color:#e5e5e5',}), required = False)
    drug_name = forms.CharField(widget = forms.TextInput(attrs = {'id':'drugName', 'class':'form-control', 'placeholder': 'Drug Name'}), required = False)
    tracking_code = forms.CharField(widget = forms.TextInput(attrs = {'id':'trackingCode', 'class':'form-control', 'placeholder': 'Tracking Code'}), required = False)
    production_date = forms.CharField(widget = forms.TextInput(attrs = {'id':'productDate', 'class':'form-control', 'placeholder': 'Production Date'}), required = False)
    expiry_date = forms.CharField(widget = forms.TextInput(attrs = {'id':'expireDate', 'class':'form-control', 'placeholder': 'Expiry Date'}), required = False)
    batch_number = forms.CharField(widget = forms.TextInput(attrs = {'id':'batchNumber', 'class':'form-control', 'placeholder': 'Batch Number'}), required = False)


###############   NAFDAC FORM   ###############
class NafdacForm(forms.ModelForm):
    reference_number = forms.CharField(widget = forms.TextInput(attrs = {'class': 'au-input au-input--full', 'placeholder': 'Reference Number'}), required = False)

    Nafdac_number = forms.CharField(widget = forms.TextInput(attrs = {'class': 'au-input au-input--full', 'placeholder': 'NAFDAC Number'}), required = False)

    class Meta:
        model = NafdacNumber
        fields = ['reference_number','Nafdac_number']

###############   SIGNUP FORM   ###############
class SignUpForm(forms.Form):
    nafdac_number = forms.CharField(label = '', widget = forms.TextInput(attrs={'class': 'au-input au-input--full', 'placeholder': "NAFDAC Number", 'readonly': True, 'style': 'background-color:#e5e5e5'}))
    password = forms.CharField(label = '', widget = forms.PasswordInput(attrs={'class': 'au-input au-input--full', 'placeholder': "Password"}))
    password2 = forms.CharField(label = '', widget = forms.PasswordInput(attrs={'class': 'au-input au-input--full', 'placeholder': "Confirm Password"}))
    company_name = forms.CharField(label='', widget=forms.TextInput(attrs={'class': 'au-input au-input--full', 'placeholder': "Company Name"}))
    company_address = forms.CharField(label='', widget=forms.TextInput(attrs={'class': 'au-input au-input--full', 'placeholder': "Company Address"}))

    def clean_password2(self):
        password = self.cleaned_data.get('password')
        password2 = self.cleaned_data.get('password2')
        if password != password2:
            raise forms.ValidationError('Password must match')
        return password2

    def clean_nafdac_number1(self):
        nafdac_number = self.cleaned_data.get('nafdac_number')
        if User.objects.filter(username__icontains = nafdac_number).exists():
            raise forms.ValidationError('This NAFDAC Number has been taken')
        return nafdac_number

###############   LOGIN FORM   ###############
class LoginForm(forms.Form):
    nafdac_number = forms.CharField(label = '', widget = forms.TextInput(attrs={'class': 'au-input au-input--full', 'placeholder': "Nafdac Number"}))
    password = forms.CharField(label = '', widget = forms.PasswordInput(attrs={'class': 'au-input au-input--full', 'placeholder': "Password"}))

    def __init__(self, request, *args, **kwargs):
        self.request = request
        super(LoginForm, self).__init__(*args, **kwargs)

    def clean(self):
        request = self.request
        data = self.cleaned_data
        nafdac_number = data.get("nafdac_number")
        password = data.get("password")
        qs = User.objects.filter(username = nafdac_number)
        user = authenticate(request, username = nafdac_number, password = password)
        if user is None:
            raise forms.ValidationError("Invalid credentials, Please Enter Correct Credentials")
        login(request, user)
        self.user = user
        user_logged_in.send(user.__class__, instance = user, request = request)
        return data