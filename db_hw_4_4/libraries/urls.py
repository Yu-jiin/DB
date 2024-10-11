from django.urls import path
from . import views


app_name = 'libraries'

urlpatterns = [
    path('', views.index, name='index'),
    path('<int:book_pk>/', views.detail, name='detail'),
    path('<int:pk>/review/', views.review, name='review'),
    path('<int:book_pk>/reviews/<int:review_pk>/delete/',
         views.review_delete, name='review_delete'),
]
