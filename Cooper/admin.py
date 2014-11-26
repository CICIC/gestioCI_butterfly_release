#encoding=utf-8


# Django commons
from django.contrib import admin
from django.contrib.admin.sites import AdminSite
from django.contrib.auth.models import User
from Cooper.forms import UserAdminAuthenticationForm
admin.site_header = "Socis"
class UserAdmin(AdminSite):
	login_form = UserAdminAuthenticationForm
	# Anything we wish to add or override
	def has_permission(self, request):
		"""  Removed check for is_staff."""
		return request.user.is_active
user_admin_site = UserAdmin(name='member')
 
