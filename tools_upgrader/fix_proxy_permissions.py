# Hack the postsyncdb signal, so we can fix the misbehavior of the 
# content_type
# assignment to the proxy models. 
# see http://code.djangoproject.com/ticket/11154

import sys

from django.contrib.auth.management import _get_all_permissions
from django.contrib.auth.models import Permission
from django.contrib.contenttypes.management import update_contenttypes
from django.contrib.contenttypes.models import ContentType
from django.db import models

def create_proxy_permissions(app, created_models, verbosity, **kwargs):

	kwargs.pop("interactive",None)
	update_contenttypes(app, created_models, verbosity, **kwargs)
	app_models = django.db.models.get_models(app)
	# This will hold the permissions we're looking for as
	# (content_type, (codename, name))
	searched_perms = list()
	# The codenames and ctypes that should exist.
	ctypes = set()
	for model in app_models:
		opts = model._meta
		if opts.proxy:
			# We can't use `get_for_model` here since it doesn't return 
			# the correct `ContentType` for proxy models.
			# see https://code.djangoproject.com/ticket/17648
			app_label, model = opts.app_label, opts.object_name.lower()
			ctype = ContentType.objects.get_by_natural_key(app_label, model)
			ctypes.add(ctype)
			for perm in _get_all_permissions(opts, ctypes):
				searched_perms.append((ctype, perm))
	
	# Find all the Permissions that have a content_type for a model we're
	# looking for. We don't need to check for codenames since we already have
	# a list of the ones we're going to create.
	all_perms = set(Permission.objects.filter(
		content_type__in=ctypes,
	).values_list(
		"content_type", "codename"
	))
	
	objs = [
		Permission(codename=codename, name=name, content_type=ctype)
		for ctype, (codename, name) in searched_perms
		if (ctype.pk, codename) not in all_perms
	]
	Permission.objects.bulk_create(objs)
	if verbosity >= 2:
		for obj in objs:
			sys.stdout.write("Adding permission '%s'" % obj)
			
models.signals.post_syncdb.connect(create_proxy_permissions)
# see `create_proxy_permissions` docstring to understand why we unregister
# this signal handler.
models.signals.post_syncdb.disconnect(update_contenttypes)