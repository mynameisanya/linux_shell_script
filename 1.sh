#!/bin/sh

MENU=(
    "Создать группу директорий и построить дерево файлов средствами команд forest и tree."
    "Создать файл. После этого вывести его содержимое на экран монитора(1) и 
в другой файл(2)."
    "Средствами команды cp копируем файл и ставим на копию защиту записи."
    "Создать два файла, в первом показать ссылку на второй. Распечатать средствами 
команды ls файлы с полными параметрами."
    "Выводим системную информация, включая версию ядра, а также время и дату. "
	"Отображаем объем дискового пространства на экране монитора и помещаем эту 
информацию в файл. "
	"Присвоим переменным x,y,z начальные значения 10, 8, 3. Вычислим результат 
подстановки в формулу  d = (a**2 + b/3)**c и выводим его. "
	"Запрос и ввод имени пользователя, и вывод сообщения – верно/неверно. "
	"Циклическое чтение системного времени и очистка экрана в заданный момент. "
	"Циклически просмотр списка файлов в каталоге и сообщение при появлении заданного 
имени в списке."
	"Запущенный скрипт проверяет права пользователя. "
	"Запущенный скрипт выводит на экран последние 10 строк журнала мониторинга каждые 5 секунд (tail /var/log/messages). "
	"Скрипт для подбора-настройки цвета «боевой окраски» консоли. Используем команду tput. Синтаксис такой. (в две строки!) : 
	tput sgr0  
	tput setaf Ы # в качестве Ы – параметр, цифра – от 1 до 7. "
	"Скрипт, который считает до 10. "
	"Скрипт, который записывает текст, набираемый на клавиатуре в файл. "
    "Завершение работы"
)
select menu in "${MENU[@]}" ; do
    case $REPLY in
        1) mkdir zad1 && mkdir zad1/cat1 && mkdir zad1/cat2 && mkdir zad1/cat1/podcat1 && mkdir zad1/cat1/podcat2 && tree && rm -r zad1;;
        2) mkdir zad2 && cd zad2 && echo "создаем файл" && echo "содержимое файла" > file1 && cat file1 &&cat file1 > file2 &&  cd .. && rm -r zad2;;
        3) mkdir zad3 && cd zad3 && echo "создаем файл" && echo "содержимое файла" > file1 && cp file1 file2 && chmod 555 file2 &&  cd .. && rm -r zad3;;
		4) mkdir zad4 && cd zad4 && echo "создаем файл и ссылку" && echo "содержимое файла" > file1 && ln -s file1 file_link && ls -li &&  cd .. && rm -r zad4;;
		5) D=$(date  +%Y-%m-%d) && T=$(date +%H:%M:%S) && echo  "$D" "$T" && uname -a ;;
		6) mkdir zad6 && cd zad6 && df -h && df -h >> file1 && cd .. && rm -r zad6;;
		7)  A=10
			B=8
			C=3
			D=(A*2+B/3)*C
			echo "$A";;
		8)  echo -n "Введите имя: "
			read
			if [ "$REPLY" == "$USER" ]; then
				echo правильно
			else
				echo не верно
			fi;;
		9)  CLTIME=12:27;
			while true; do
				CURRTIME=$(date +%H:%M);
				if [ $CURRTIME == $CLTIME ]; then
				clear;
				break;
			fi;
		done;
		;;
		10) mkdir zad10 && cd zad10 && echo "abz" >> list && $LIST=list && $SECRETNAME="abz"
			while true; do
				if grep -w "$CERTNAME" "$LIST" > /dev/null; then
					echo found;
					break;
				fi;
			done;
			cd .. && rm -r zad10;;
		11) if (($EUID !=0)); then
				echo "Рут прав нет"
				exit
			fi
			if (($EUID !=1)); then
				echo "Рут права есть"
				exit
			fi;;
		12)tail -f /var/log/Xorg.0.log;;
		13) mkdir zad13 && cd zad13 && tput sgr0 && tput setaf 1 && cd .. && rm -r zad13;;
		14) for (( i=1; i <= 10; i++ ))
			do
			echo "это число $i"
			done;;
		15) mkdir zad15 && cd zad15 && echo "введите слово в файл: " && read var && $var >> file1 && cd .. && rm -r zad15;;
        6) break ;;
    esac
done