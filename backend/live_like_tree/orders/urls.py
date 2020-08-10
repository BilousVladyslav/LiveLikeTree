from rest_framework.routers import DefaultRouter
from .views import OrdersViewSet, OrdersStatusViewSet


router = DefaultRouter()
router.register(r'^api/orders/manage', OrdersStatusViewSet, basename='orders')
router.register(r'^api/orders', OrdersViewSet, basename='orders')


orders_urlpatterns = router.urls
