# I recommend you create a Repository Administrators group so you can lower the scope from Project Administrators, which has access to everything, to just code

$adoBaseUrl = 'https://dev.azure.com'
$adoOrg = 'SomeOrg'
$adoUrl = "$adoBaseUrl/$adoOrg/"

# Prevents creating branches at the root of the repository
tf.exe git permission /deny:CreateBranch /group:[$adoProject]\Contributors /collection:$adoUrl /teamproject:$adoProject /repository:$adoRepo
 
# Allows Repository Administrators to create some root branches and/or branch folder structure like release/1.9.3
tf.exe git permission /allow:CreateBranch /group:"[$adoProject]\Project Administrators" /collection:$adoUrl /teamproject:$adoProject /repository:$adoRepo /branch:release
tf.exe git permission /allow:CreateBranch /group:"[$adoProject]\Project Administrators" /collection:$adoUrl /teamproject:$adoProject /repository:$adoRepo /branch:main
tf.exe git permission /allow:CreateBranch /group:"[$adoProject]\Project Administrators" /collection:$adoUrl /teamproject:$adoProject /repository:$adoRepo /branch:dev
tf.exe git permission /allow:CreateBranch /group:"[$adoProject]\Project Administrators" /collection:$adoUrl /teamproject:$adoProject /repository:$adoRepo /branch:master
tf.exe git permission /allow:CreateBranch /group:"[$adoProject]\Project Administrators" /collection:$adoUrl /teamproject:$adoProject /repository:$adoRepo /branch:other
tf.exe git permission /allow:CreateBranch /group:"[$adoProject]\Project Administrators" /collection:$adoUrl /teamproject:$adoProject /repository:$adoRepo /branch:feature
tf.exe git permission /allow:CreateBranch /group:"[$adoProject]\Project Administrators" /collection:$adoUrl /teamproject:$adoProject /repository:$adoRepo /branch:users
 
 
# Allows Contributors to create branches under the feature branch folder and the users branch folder
tf.exe git permission /allow:CreateBranch /group:[$adoProject]\Contributors /collection:$adoUrl /teamproject:$adoProject /repository:$adoRepo /branch:feature
tf.exe git permission /allow:CreateBranch /group:[$adoProject]\Contributors /collection:$adoUrl /teamproject:$adoProject /repository:$adoRepo /branch:users
