# Generated by Django 3.1 on 2020-08-10 13:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('graveyard', '0002_auto_20200809_2342'),
        ('orders', '0003_auto_20200810_1615'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='graveyard',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='graveyard.graveyard'),
            preserve_default=False,
        ),
    ]
