from django.http import Http404
from django.db.models import Count
from django.contrib import messages
from django.shortcuts import redirect
from django.contrib.auth import get_user_model
from .models import NafdacNumber, Company, Drug
from django.contrib.auth.mixins import LoginRequiredMixin
from Drug.mixins import NextUrlMixin, RequestFormAttachMixin
from .forms import NafdacForm, SignUpForm, LoginForm, DrugForm, DrugUpdateForm, DrugConfirmForm
from django.views.generic  import FormView, DetailView, CreateView, ListView, UpdateView

User = get_user_model()

# Create your views here.

#################   DRUG CONFIRMATION   #################
class DrugConfirmationSuccessView(DetailView):
    template_name = 'drug/nafdac_number.html'
    
    def get_context_data(self, *args, **kwargs):
        context = super(DrugConfirmationSuccessView, self).get_context_data(*args, **kwargs)
        drug = Drug.objects.get(tracking_code = self.get_object())
        context["drug"] = drug
        return context
    
    def get_object(self):
        tracking_code = self.request.session['tracking_code']
        return tracking_code    
    
#################   DRUG CONFIRMATION   #################
class DrugConfirmationView(FormView):
    form_class = DrugConfirmForm
    success_url = 'accounts:home'
    template_name = 'nafdac/nafdac_number.html'
    
    def get_context_data(self, *args, **kwargs):
        context = super(DrugConfirmationView, self).get_context_data(*args, **kwargs)
        return context
    
    def form_valid(self, form):
        tracking_code = form.cleaned_data.get('tracking_code')
        tracking_code_exist = Drug.objects.filter(tracking_code = tracking_code).exists()
        if tracking_code_exist:
            if Drug.objects.get(tracking_code = tracking_code).active:
                self.request.session['tracking_code'] = tracking_code
                drug = Drug.objects.get(tracking_code = tracking_code)
                drug.active = False
                drug.save()
                return redirect('confirm_drug_success')
            messages.error(self.request, "The drug has been used")
            return redirect('confirm_drug')
        messages.error(self.request, "This Tracking code does not exist, If you are sure of typing the correct tracking code on the drug tablet pack, the drug is fake please don't use")
        return redirect('confirm_drug')

###############   DRUG DETAIL   ###############
class DrugDetailSlugView(LoginRequiredMixin, UpdateView):
    template_name = "drug/edit.html"
    form_class = DrugUpdateForm

    def get_context_data(self, *args, **kwargs):
        context = super(DrugDetailSlugView, self).get_context_data(*args, **kwargs)
        context["nafdac_number"] = self.request.user
        return context

    def get_object(self, *args, **kwargs):
        request = self.request
        slug = self.kwargs.get('slug')
        try:
            instance = Drug.objects.get(tracking_code = slug, active = True)
        except Drug.DoesNotExist:
            raise Http404("Not found")
        except Drug.objects.get(tracking_code = slug, active = False):
            raise Http404("The Drug has been sold")
        except Drug.MultipleObjectsReturned:
            qs = Drug.objects.filter(tracking_code = slug, active = True)
            instance = qs.first()
        except:
            raise ("Wao")
        return instance
    
    def form_valid(self, form):
        drug = form.save(commit=True)
        drug.drug_name = self.request.POST.get('drug_name')
        drug.production_date = self.request.POST.get('production_date')
        drug.expiry_date = self.request.POST.get('expiry_date')
        drug.batch_number = self.request.POST.get('batch_number')
        drug.save()
        return redirect('accounts:home')

#################   DRUG CREATE   #################
class DrugCreateView(LoginRequiredMixin, FormView):
    form_class = DrugForm
    success_url = 'accounts:home'
    template_name = 'drug/form.html'
    
    def get_context_data(self, *args, **kwargs):
        context = super(DrugCreateView, self).get_context_data(*args, **kwargs)
        context["nafdac_number"] = self.request.user 
        return context
    
    def form_valid(self, form):
        nafdac_number = form.cleaned_data.get('nafdac_number')
        drug_name = form.cleaned_data.get('drug_name')
        tracking_code = form.cleaned_data.get('tracking_code')
        production_date = form.cleaned_data.get('production_date')
        expiry_date = form.cleaned_data.get('expiry_date')
        batch_number = form.cleaned_data.get('batch_number')
        drug_created = Drug.objects.filter(tracking_code = tracking_code).exists()
        if drug_created:
            messages.error(self.request, "This Tracking code exist")
            return redirect('accounts:add-drug')
        company = User.objects.get(username = nafdac_number)
        new_drug = Drug.objects.create(nafdac_number = company, drug_name = drug_name, tracking_code = tracking_code, production_date = production_date, expiry_date = expiry_date, batch_number = batch_number)
        new_drug.save()
        return redirect('accounts:home')
    

#################   DASHBOARD   #################
class DashboardView(LoginRequiredMixin, ListView):
    template_name = 'accounts/index.html'
    
    def get_context_data(self, *args, **kwargs):
        context = super(DashboardView, self).get_context_data(*args, **kwargs)
        context["nafdac_number"] = self.get_object() 
        # all_drug = Drug.objects.all().filter(nafdac_number = self.get_object()).values('drug_name').distinct()  
        all_drug = Drug.objects.filter(nafdac_number = self.get_object())
        all_drugs_count =  Drug.objects.filter(nafdac_number = self.get_object()).values('drug_name').annotate(count = Count('drug_name'))
        context["all_drug"] = all_drug
        context["company_all_drugs"] = all_drugs_count
        return context
    
    def get_queryset(self, *args, **kwargs):
        qs = Drug.objects.all()
        return qs

    def get_object(self):
        return self.request.user

#################   LOGIN   #################
class LoginView(NextUrlMixin, RequestFormAttachMixin, FormView):
    form_class = LoginForm
    success_url = 'accounts:home'
    template_name = 'accounts/login.html'
    default_next = "accounts:home"

    def form_valid(self, form):
        next_path = self.get_next_url()
        return redirect(next_path)


#################   SIGNUP   ################
class UserSignupView(NextUrlMixin, FormView):
    template_name = 'accounts/signup.html'
    form_class = SignUpForm
    success_url = 'login'

    def get_context_data(self, *args, **kwargs):
        context = super(UserSignupView, self).get_context_data(*args, **kwargs)
        context['naf_number'] = self.request.session['Nafdac_number']
        return context

    def form_valid(self, form):
        nafdac_number = form.cleaned_data.get('nafdac_number')
        password = form.cleaned_data.get('password')
        company_name = form.cleaned_data.get('company_name')
        company_address = form.cleaned_data.get('company_address')
        new_user = User.objects.create(username = nafdac_number)
        new_user.set_password(password)
        new_user.save()
        users_created = User.objects.get(username = nafdac_number)
        if users_created:
            new_company_user = Company.objects.create(nafdac_number = new_user, company_name = company_name, company_address = company_address)
            new_company_user.save()
        return super(UserSignupView, self).form_valid(form)


###############   NAFDAC NUMBER CONFIRMATION  ###############
class NafdacfNumberConfirmationView(NextUrlMixin, FormView):
    form_class = NafdacForm
    success_url = 'signup'
    template_name = 'nafdac/nafdac_number.html'
    default_next = "signup"

    def form_valid(self, form):
        Nafdac_number = form.cleaned_data.get('Nafdac_number')
        Nafdac_number_exist = NafdacNumber.objects.filter(Nafdac_number = Nafdac_number).exists()
        if Nafdac_number_exist:
            if User.objects.filter(username = Nafdac_number).exists():
                messages.error(self.request, "Nafdac Number exit but has been used")
                return redirect('register')
            self.request.session['Nafdac_number'] = Nafdac_number
            next_path = self.get_next_url()
            return redirect(next_path)
        messages.error(self.request, "Invalid NAFDAC Number")
        return redirect('register')


