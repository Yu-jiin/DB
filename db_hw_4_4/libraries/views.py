from django.shortcuts import render, redirect
from .models import Book, Review

from .forms import ReviewForm
# Create your views here.
def index(request):
    books = Book.objects.all()
    context = {
        'books': books
    }
    return render(request, 'libraries/index.html', context)

def detail(request, book_pk):
    book = Book.objects.get(pk=book_pk)
    reviewForm = ReviewForm()
    reviews = book.review_set.all()
    context = {
        'book': book,
        'reviewForm' : reviewForm,
        'reviews' : reviews,
    }
    return render(request, 'libraries/detail.html', context)

def review(request, pk):
    book = Book.objects.get(pk=pk)
    reviewForm = ReviewForm(request.POST)
    if reviewForm.is_valid():
        review =reviewForm.save(commit=False)
        review.book = book
        review.user = request.user
        review.save()
        return redirect('libraries:detail' , book.pk)
    context = {
        'book' : book,
        'reviewForm' : reviewForm,
    }
    return render(request, 'libraries/detail.html', context)

def review_delete(request, book_pk, review_pk):
    review = Review.objects.get(pk = review_pk)
    if request.user == review.user:
        book = Book.objects.get(pk = book_pk)
        review.delete()
    return redirect('libraries:detail', book_pk)