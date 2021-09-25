#! /bin/bash
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
  else
    if [ $# -eq 1 ]
     then
     echo "$(tput setaf 1)Changinging newsblur_web/docker_local_settings.py:$(tput setaf 2) localhost to $1$(tput sgr 0)"
     sed -i'.bak'  -e "/NEWSBLUR_URL/ s/nb\.macklin\.co/$1/" -e "/NEWSBLUR_SESSION_COOKIE/ s/localhost/$1/" './newsblur_web/docker_local_settings.py'
     head -20 './newsblur_web/docker_local_settings.py'
     echo "$(tput setaf 1)Changinging config/fixtures/bootstrap.json:$(tput setaf 2) localhost to $1$(tput sgr 0)"
     sed -i'.bak' "/domain/ s/nb\.macklin\.co/$1/" './config/fixtures/bootstrap.json'
     head -10 './config/fixtures/bootstrap.json'
    else
      if [ $# -eq 2 ]
      then
       echo "$(tput setaf 1)Changinging newsblur_web/docker_local_settings.py: $(tput setaf 2)$1 to $2$(tput sgr 0)"
       sed -i'bak' -e "/NEWSBLUR_URL/ s/$1/$2/" -e "/NEWSBLUR_SESSION_COOKIE/ s/$1/$2/" './newsblur_web/docker_local_settings.py' 
       head -20 './newsblur_web/docker_local_settings.py'
       echo "$(tput setaf 1)Changinging config/fixtures/bootstrap.json: $(tput setaf 2)$1 to $2$(tput sgr 0)"
       sed -i'bak' -e "/domain/ s/$1/$2/" './config/fixtures/bootstrap.json'
       head -10 './config/fixtures/bootstrap.json'
      fi
    fi
fi
