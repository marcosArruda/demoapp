application_java Cookbook CHANGELOG
===================================
This file is used to list changes made in each version of the application_java cookbook.


v3.0.0
------
### Breaking
- Drops support for Chef 10

### Improvement
- **[COOK-3563](https://tickets.opscode.com/browse/COOK-3563)** - Replace calls to `Chef::Mixin::RecipeDefinitionDSLCore`

v2.0.0
------
### Bug
- [COOK-3306]: Multiple Memory Leaks in Application Cookbook

v1.1.0
------
### Bug
- [COOK-2523]: deployments do not follow standards set by the Deploy provider

v1.0.4
------
- [COOK-2271] - ValidationFailed error in `java_webapp` provider

v1.0.2
------
- [COOK-1680] - Add deploy action (alias for create) to `java_remote_file`

v1.0.0
------
- [COOK-1243] - Initial release - relates to COOK-634.
