# DB - 과평공부 안하냐 ? 
      - 통과했다 13일의 유지인아.

# 정처기 - 공부 안하냐 ?
      - 20일의 내가 ...

--------------------------------------

ManyToManyField() - M:N 관계 설정 모델 필드

class Patient(models.Model):
    # ManyToManyFields 작성
    doctors = models.ManyToManyField(Doctor)
    
    name = models.TextField()
    def __str__(self):
        return f'{self.pk}번 환자 {self.name}'

- 추가 의사 예약하고 결과 확인하기 
patient1.doctors.add(doctor1)
patient1.doctors.all()
이고는 역참조 ! 
doctor1.patient_set.all()


241014 온실 끝 