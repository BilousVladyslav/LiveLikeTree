from django.conf.urls import url
from .views import UserProfile, GetUsersList

profile_urlpatterns = [
    url(r'^api/profile/my/$', UserProfile.as_view()),
    url(r'^api/profiles/$', UserProfile.as_view()),
]
