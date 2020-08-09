from rest_framework.routers import DefaultRouter
from .views import GraveyardsViewSet, PlacesViewSet, UserPlacesViewSet


router = DefaultRouter()
router.register(r'^api/graveyards', GraveyardsViewSet, basename='graveyard')
router.register(r'^api/places', PlacesViewSet, basename='place')
router.register(r'^api/my_places', UserPlacesViewSet, basename='places')


graveyards_urlpatterns = router.urls
