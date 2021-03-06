# Generated by Django 3.1 on 2020-08-10 13:15

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('graveyard', '0002_auto_20200809_2342'),
        ('orders', '0002_auto_20200809_2342'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='places',
        ),
        migrations.AddField(
            model_name='order',
            name='created',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AddField(
            model_name='order',
            name='graveyard',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='graveyard.graveyard'),
        ),
        migrations.AddField(
            model_name='order',
            name='to_pay',
            field=models.IntegerField(default=0),
        ),
        migrations.CreateModel(
            name='PlaceInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.IntegerField()),
                ('tree', models.CharField(max_length=150)),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='places', to='orders.order')),
            ],
        ),
    ]
