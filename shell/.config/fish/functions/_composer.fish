function _composer -d "Load composer abbreviations is php present"
    if command -q php
        abbr --add cmp composer
        abbr --add cmpcp composer create-project
        abbr --add cmpdo composer dump-autoload -o
        abbr --add cmpdu composer dump-autoload
        abbr --add cmpget curl -s https://getcomposer.org/installer | php
        abbr --add cmpgr composer global require
        abbr --add cmpgrm composer global remove
        abbr --add cmpgu composer global update
        abbr --add cmpi composer install
        abbr --add cmpo composer outdated
        abbr --add cmpod composer outdated --direct
        abbr --add cmpr composer require
        abbr --add cmprm composer remove
        abbr --add cmps composer show
        abbr --add cmpsu composer self-update
        abbr --add cmpu composer update
        abbr --add cmpuh composer update --working-dir=$(composer config -g home)
    end
end
