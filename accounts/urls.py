from django.urls import path
from django.conf.urls import url
from .views import DashboardView, DrugCreateView, DrugDetailSlugView

app_name = 'accounts'

urlpatterns = [
    path('', DashboardView.as_view(), name = 'home'),
    path('add_drug', DrugCreateView.as_view(), name = 'add-drug'),
    path('edit_drug/<slug>/', DrugDetailSlugView.as_view(), name = 'drug-update'),
]