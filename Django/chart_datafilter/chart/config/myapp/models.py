from django.db import models

class Product(models.Model):
    product_code = models.CharField(max_length=100, unique=True)
    purchase_quantity = models.IntegerField()
    production_quantity = models.IntegerField()
    average_sales = models.DecimalField(max_digits=10, decimal_places=2)
    sell_through_rate = models.DecimalField(max_digits=5, decimal_places=2)
    market_share = models.DecimalField(max_digits=5, decimal_places=2)

class SalesRegion(models.Model):
    name = models.CharField(max_length=100)
    purchase_quantity = models.IntegerField()
