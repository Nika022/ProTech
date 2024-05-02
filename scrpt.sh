#!/bin/bash

#чтение директорий
read input_dir
read output_dir



#функция обхода входной директории "вглубь"
go_recurse() {
#цикл обхода
    for i in $(ls -A $1);do
#проверяем есть ли дальнейшее ветвление, если да , то рекурсивно идем глубже, если нет - копируем файл в выходную директорию
        if [ -d $i ];then
            go_recurse $i $2
        elif [ -f $i ];then
            cp $i $2
        fi
    done
}
#вызываем функцию для наших директорий
go_recurse $input_dir $output_dir

