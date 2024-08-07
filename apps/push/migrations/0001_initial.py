# Generated by Django 2.0 on 2020-06-16 06:52

import datetime

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):
    initial = True

    dependencies = [
        ("rss_feeds", "0001_initial"),
    ]

    operations = [
        migrations.CreateModel(
            name="PushSubscription",
            fields=[
                (
                    "id",
                    models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name="ID"),
                ),
                ("hub", models.URLField(db_index=True)),
                ("topic", models.URLField(db_index=True)),
                ("verified", models.BooleanField(default=False)),
                ("verify_token", models.CharField(max_length=60)),
                ("lease_expires", models.DateTimeField(default=datetime.datetime.now)),
                (
                    "feed",
                    models.OneToOneField(
                        on_delete=django.db.models.deletion.CASCADE, related_name="push", to="rss_feeds.Feed"
                    ),
                ),
            ],
        ),
    ]
