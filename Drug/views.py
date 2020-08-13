from accounts.forms import NafdacForm
from accounts.models import NafdacNumber
from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django.views.generic.edit import FormView
from Drug.utils import unique_nafdac_number_generator

#################   NAFDAC NUMBER   ################
class NafdacNumberView(FormView):
    template_name = 'nafdac/nafdac_number.html'
    form_class = NafdacForm
    success_url = '/naf'

    def form_valid(self, form):
        reference_number = form.cleaned_data.get('reference_number')
        user = User.objects.get(username = 'Admin')
        new_reference_number = NafdacNumber.objects.create(reference_number = reference_number, Nafdac_number = unique_nafdac_number_generator(user))
        new_reference_number.save()
        return super(NafdacNumberView, self).form_valid(form)

#################   INDEX   ################
def home_page(request):
    return render(request, "home/index.html")

