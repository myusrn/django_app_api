# django web app and api framework use test

version = 7/31/22 <- 6/19/22  
setup to test creation of mvc and static web app and crud web api solution using python django frameworks  
using to test azure app service deployment of python django app runtime and k8s containerized packaging  
  
**enable django support**  
pipecr djg  
pipea djg  
pipi django # ; pymv django
pipi djangorestframework # ; pymv djangorestframework

**commands to create django project**  
pushd django_project  
django-admin startproject mysite  
pushd mysite  

**commands to create web app**  
py manage.py startapp myapp  
&lt;define classes in models.py&gt;

**commands to create web api**
py manage.py startapp myapi  
&lt;define classes in models.py&gt;

**create or update models persistence support**
py manage.py makemigrations # only required in update cases
py manage.py migrate  

**commands to run site**  
py manage.py runserver  
py manage.py createsuperuser | enter desired credentials  
py manage.py runserver  
  
***commands using interactive shell***
py manage.py shell  
from base.models import Item
Item.objects.create(name="Item #1") # repeat for a few objects
items = Item.objects.all()
print(items)
exit()

***azure python [ / django ] web app and/or api deployment***
vscode | extensions | azure tools 
signin to azure subscription from extension view
create new python 3.9/3.8 app service
- Created new web app "ob1-django-app-api": https://ob1-django-app-api.azurewebsites.net
- azure extension | <subscription> | app services | <python app service> | app settings | add new setting | SCM_DO_BUILD_DURING_DEPLOYMENT with value 1
- follow details in [Deploying Django to Azure](https://youtu.be/D6Wyk9q2JM0) Jul 15, 2021, e.g. addition of requirements.txt and .deployment files
    
**references**  
\- [creating simple website with django framework](https://youtu.be/ZsJRXS_vrw0) Apr 15, 2020  
\- [django series by corey schafer](https://youtube.com/playlist?list=PL-osiE80TeTtoQCKZ03TU5fNfx2UY6U4p) Feb 18, 2019  
\- [django rest framework overview](https://youtu.be/cJveiktaOSQ) Jan 25, 2022  
\- [django rest framework crud](https://youtube.com/results?search_query=django+rest+framework+crud) -> [Build a Django API from Scratch](https://youtu.be/i5JykvxUk_A) Feb 21, 2022  
\- [debug a django app in vscode](https://youtu.be/spmFjhQIKOo) Dec 18, 2021  
\- [deploy django app to azure](https://youtu.be/D6Wyk9q2JM0) Jul 15, 2021  
\- [dokerize a django app](https://youtu.be/BoM-7VMdo7s) Oct 21, 2021  
\- [dockerize django in 5 minutes](https://youtu.be/8c14GBrbglw) Jul 27, 2021  
\- [django with docker best practices](https://youtu.be/4wdNx2j1j-w) Jul 14, 2021 to use django-environ package .env file for secrets instead of .vscode/env.dev and env.prd  
\- also see '[vscode attach to container](https://www.bing.com/search?q=vscode+attach+to+container)' -> [https://code.visualstudio.com/docs/remote/containers](https://code.visualstudio.com/docs/remote/containers)  
]
  
\- for vscode problems with signature '(module) &lt;module&gt; \n Import "django.&lt;module&gt;" could not be resolved from source Pylance(reportMissingModuleSource)' use f1 or ctrl+shift+p | python select interpreter | &lt;select venv with django packages installed&gt;  
\- [set django root url redirect](https://stackoverflow.com/questions/48504649/django-url-patterns-redirect-from-root-to-other-url) Jan 29, 2018  
\- [set django root/super user credentials](https://stackoverflow.com/questions/65240677/django-admin-interface-how-to-change-user-password) Mar 12, 2021  
\- [azure django admin csrf verification failed. request aborted.](https://youtube.com/results?search_query=azure+django+admin+csrf+verification+failed.+request+aborted.) -> [Django Admin - CSRF verification failed. Request aborted - Django](https://youtu.be/ceMmHSeYILI) May 16, 2022 -> enable app service plan setup to expose http tcp/80 that redirects to https tcp/443  
\- [Django Secret Key accessible on GitHub](https://dashboard.gitguardian.com/core-alerting/incident-resolution/dafcbbc2-9364-4638-961d-a497bb76f5b5/) -> change mysite/settings.py SECRET_KEY to read value from dev workstation environment variable, e.g. export SECRET_KEY='django-insecure-&lt;secret_key_hash&gt;' and clear using unset SECRET_KEY, or configuration plane secrets manager in the case of PaaS and IaaS deployments. for more see https://blog.gitguardian.com/secrets-api-management/ -> https://res.cloudinary.com/da8kiytlc/image/upload/v1592031041/Cheatsheets/secrets_cheatsheet_bedizg.pdf + https://docs.gitguardian.com/secrets-detection/detectors/specifics/django_secret_key  
