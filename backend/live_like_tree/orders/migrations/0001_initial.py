# Generated by Django 3.1 on 2020-08-09 20:13

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('graveyard', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('status', models.CharField(choices=[('cancelled', 'Cancelled'), ('paid', 'Paid'), ('waiting', 'Waiting for payment')], default='waiting', max_length=50)),
                ('owner', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('places', models.ManyToManyField(related_name='orders', to='graveyard.Place')),
            ],
        ),
    ]
