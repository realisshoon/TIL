from django.http import JsonResponse
from .models import Product, SalesRegion

def filter_data(request):
    # Example: Filtering by product code; adjust according to actual filters
    product_code = request.GET.get('product_code')
    products = Product.objects.filter(product_code=product_code).values()
    return JsonResponse(list(products), safe=False)
