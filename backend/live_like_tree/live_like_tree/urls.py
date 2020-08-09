from django.conf.urls import url
from django.contrib import admin
from django.urls import path, include

from user_profile.urls import profile_urlpatterns
from graveyard.urls import graveyards_urlpatterns

urlpatterns = [
    path('admin/', admin.site.urls),
]

urlpatterns += profile_urlpatterns
urlpatterns += graveyards_urlpatterns