from django.db import models
from django.conf import settings

# Create your models here.
class Article(models.Model):
    # 일반적인 다른 app 으로부터 Model을 import 했을때 발생하는 문제
    # settings.py -> INSTALLED_APPS에 등록한 순서에 영향을 받음 
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    title = models.CharField(max_length=10)
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class Comment(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    # 참조하려는 대상의 단수형을 외래키로
    article = models.ForeignKey(Article, on_delete=models.CASCADE)
    content = models.CharField(max_length=200)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


