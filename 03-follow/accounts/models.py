from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.
class User(AbstractUser):
    followings = models.ManyToManyField('self', symmetrical=False, related_name='followers')
    # 한쪽은 팔로우하고 한쪽은 안할 수도 있으니 symmetrical=False