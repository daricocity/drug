"""Drug URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.contrib import admin
from django.conf import settings
from django.urls import path, include
from django.conf.urls.static import static
from .views import home_page, NafdacNumberView
from django.contrib.auth.views import LogoutView
from accounts.views import NafdacfNumberConfirmationView, UserSignupView, LoginView, DrugConfirmationView, DrugConfirmationSuccessView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home_page, name = 'home'),
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('naf', NafdacNumberView.as_view(), name = 'nafdac'),
    path('signup', UserSignupView.as_view(), name = 'signup'),
    path('accounts/', include("accounts.urls", namespace = 'accounts')),
    path('confirm_drug', DrugConfirmationView.as_view(), name = 'confirm_drug'),
    path('confirm_drug/success', DrugConfirmationSuccessView.as_view(), name = 'confirm_drug_success'),
    path('register', NafdacfNumberConfirmationView.as_view(), name = 'register'),
] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)
