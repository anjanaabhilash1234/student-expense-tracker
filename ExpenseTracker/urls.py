"""ExpenseTracker URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
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
from django.urls import path
from Expenseapp.views import *
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.views.generic import TemplateView
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',index,name="index"),
    path('index/',index,name="index"),
    # path('student/',student,name="student"),
    path('loginaction/',loginaction,name="loginaction"),
    path('adminhome/',adminhome,name="ladminhomeogin"),
    path('studenthome/',studenthome,name="studenthome"),
    path('studentaction/',studentaction,name="studentaction"),
    path('avstudents/',avstudents,name="avstudents"),
    path('delstud/',delstud,name="delstud"),
    path('sprofile/',sprofile,name="sprofile"),
    path('supdateaction/',supdateaction,name="supdateaction"),
    path('category/',category,name="category"),
    path('icaction/',icaction,name="icaction"),
    path('ecaction/',ecaction,name="ecaction"),
    path('delic/',delic,name="delic"),
    path('delec/',delec,name="delec"),
    path('expense/',expense,name="expense"),
    path('income/',income,name="income"),
    path('incaction/',incaction,name="incaction"),
    path('exaction/',exaction,name="exaction"),
    path('sreport/',sreport,name="sreport"),
    path('budget/',budget,name="budget"),
    path('budgetaction/',budgetaction,name="budgetaction "),
    path('delbgt/',delbgt,name="delbgt"),
    path('saving_suggestions/',saving_suggestions,name="saving_suggestions"),
    path('payment_analysis/',payment_analysis,name="payment_analysis"),
    path('budget_prediction/',budget_prediction,name="budget_prediction"),
    path('spending_pattern/',spending_pattern,name="spending_pattern"),
    path('delincome/',delincome,name="delincome"),
    path('delexpense/',delexpense,name="delexpense"),
    path('future_expense_prediction/',future_expense_prediction,name="future_expense_prediction"),
    path('update_ec/',update_ec,name="update_ec"),
    path('update_ic/',update_ic,name="update_ic"),
    path('feedback/',feedback,name="feedback"),
    path('fbaction/',fbaction,name="fbaction"),
    path('avfeedback/',avfeedback,name="avfeedback"),
    path('forgotpasswordaction/',forgotpasswordaction,name="forgotpasswordaction"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),
    path('login/',login,name="login"),


]
