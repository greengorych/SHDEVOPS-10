

# Домашнее задание к занятию 4 «Оркестрация группой Docker контейнеров на примере Docker Compose»

### Инструкция к выполению

1. Для выполнения заданий обязательно ознакомьтесь с [инструкцией](https://github.com/netology-code/devops-materials/blob/master/cloudwork.MD) по экономии облачных ресурсов. Это нужно, чтобы не расходовать средства, полученные в результате использования промокода.
2. Практические задачи выполняйте на личной рабочей станции или созданной вами ранее ВМ в облаке.
3. Своё решение к задачам оформите в вашем GitHub репозитории в формате markdown!!!
4. В личном кабинете отправьте на проверку ссылку на .md-файл в вашем репозитории.

## Задача 1

Сценарий выполнения задачи:
- Установите docker и docker compose plugin на свою linux рабочую станцию или ВМ.
- Если dockerhub недоступен создайте файл /etc/docker/daemon.json с содержимым: ```{"registry-mirrors": ["https://mirror.gcr.io", "https://daocloud.io", "https://c.163.com/", "https://registry.docker-cn.com"]}```
- Зарегистрируйтесь и создайте публичный репозиторий  с именем "custom-nginx" на https://hub.docker.com (ТОЛЬКО ЕСЛИ У ВАС ЕСТЬ ДОСТУП);
- скачайте образ nginx:1.21.1;
- Создайте Dockerfile и реализуйте в нем замену дефолтной индекс-страницы(/usr/share/nginx/html/index.html), на файл index.html с содержимым:
```
<html>
<head>
Hey, Netology
</head>
<body>
<h1>I will be DevOps Engineer!</h1>
</body>
</html>
```
- Соберите и отправьте созданный образ в свой dockerhub-репозитории c tag 1.0.0 (ТОЛЬКО ЕСЛИ ЕСТЬ ДОСТУП). 
- Предоставьте ответ в виде ссылки на https://hub.docker.com/<username_repo>/custom-nginx/general.


Ответ

https://hub.docker.com/repository/docker/greengorych/custom-nginx/general

## Задача 2
1. Запустите ваш образ custom-nginx:1.0.0 командой docker run в соответвии с требованиями:
- имя контейнера "ФИО-custom-nginx-t2"
- контейнер работает в фоне
- контейнер опубликован на порту хост системы 127.0.0.1:8080
2. Не удаляя, переименуйте контейнер в "custom-nginx-t2"
3. Выполните команду ```date +"%d-%m-%Y %T.%N %Z" ; sleep 0.150 ; docker ps ; ss -tlpn | grep 127.0.0.1:8080  ; docker logs custom-nginx-t2 -n1 ; docker exec -it custom-nginx-t2 base64 /usr/share/nginx/html/index.html```
4. Убедитесь с помощью curl или веб браузера, что индекс-страница доступна.

В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод.

Ответ пункт 1

![image](https://github.com/user-attachments/assets/ea9c96aa-0ea2-4d18-8dde-480b1bdfb23d)

Ответ пункт 2

![image](https://github.com/user-attachments/assets/0953d00e-c428-4565-89df-2520cf673b95)

Ответ пункт 3

![image](https://github.com/user-attachments/assets/85277ef0-86e4-4caa-a2de-0142e447633b)

Ответ пункт 4

![image](https://github.com/user-attachments/assets/d3663039-702b-4f44-baf6-1552bbfa1183)

## Задача 3
1. Воспользуйтесь docker help или google, чтобы узнать как подключиться к стандартному потоку ввода/вывода/ошибок контейнера "custom-nginx-t2".
2. Подключитесь к контейнеру и нажмите комбинацию Ctrl-C.
3. Выполните ```docker ps -a``` и объясните своими словами почему контейнер остановился.
4. Перезапустите контейнер
5. Зайдите в интерактивный терминал контейнера "custom-nginx-t2" с оболочкой bash.
6. Установите любимый текстовый редактор(vim, nano итд) с помощью apt-get.
7. Отредактируйте файл "/etc/nginx/conf.d/default.conf", заменив порт "listen 80" на "listen 81".
8. Запомните(!) и выполните команду ```nginx -s reload```, а затем внутри контейнера ```curl http://127.0.0.1:80 ; curl http://127.0.0.1:81```.
9. Выйдите из контейнера, набрав в консоли  ```exit``` или Ctrl-D.
10. Проверьте вывод команд: ```ss -tlpn | grep 127.0.0.1:8080``` , ```docker port custom-nginx-t2```, ```curl http://127.0.0.1:8080```. Кратко объясните суть возникшей проблемы.
11. * Это дополнительное, необязательное задание. Попробуйте самостоятельно исправить конфигурацию контейнера, используя доступные источники в интернете. Не изменяйте конфигурацию nginx и не удаляйте контейнер. Останавливать контейнер можно. [пример источника](https://www.baeldung.com/linux/assign-port-docker-container)
12. Удалите запущенный контейнер "custom-nginx-t2", не останавливая его.(воспользуйтесь --help или google)

В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод.

Ответ пункты 1 и 2

![image](https://github.com/user-attachments/assets/a801b66f-f2f4-4327-9d86-a5f24cf5e217)

Ответ пункт 3

![image](https://github.com/user-attachments/assets/5fac1d6c-b1e4-4be2-9fb8-5a51d1f27c7d)

Сочетание клавиш CTRL-C отправлет сигнал прерывания процесса - SIGINT. Т.к. контейнер существует пока работает процесс, происходит остановка контейнера.

Ответ пункт 4

![image](https://github.com/user-attachments/assets/0b427908-9ed2-42bb-b74b-a3f404e33c0b)

Ответ пункт 5

![image](https://github.com/user-attachments/assets/088bc049-b38b-40aa-95d7-7cec4674e068)

Ответ пункт 6

![image](https://github.com/user-attachments/assets/d8c613ad-12d7-431d-8693-beec45ae5ce6)

Ответ пункт 7

![image](https://github.com/user-attachments/assets/ba17b3be-011d-43f4-b677-1504ae0d7b22)

![image](https://github.com/user-attachments/assets/19553276-8ab8-4eac-bcd9-7ab3832a8311)

Ответ пункт 8

![image](https://github.com/user-attachments/assets/d02b4b16-3969-4013-8132-e0c055de4e5f)

Ответ пункт 10

![image](https://github.com/user-attachments/assets/51fa44c5-186d-41c5-b269-0eb6834fd086)

При запуске контейнера я указл проброс порта 8080 внутрь контейнера на порт 80 на котором работает nginx.
В пункте 7 данной работы я изменил порт nginx с 80 на 81, поэтому nginx стал недоступен.

Ответ пункт 12

![image](https://github.com/user-attachments/assets/8034b20d-3747-4cd5-a3b2-32149e02e92e)

## Задача 4
- Запустите первый контейнер из образа ***centos*** c любым тегом в фоновом режиме, подключив папку  текущий рабочий каталог ```$(pwd)``` на хостовой машине в ```/data``` контейнера, используя ключ -v.
- Запустите второй контейнер из образа ***debian*** в фоновом режиме, подключив текущий рабочий каталог ```$(pwd)``` в ```/data``` контейнера. 
- Подключитесь к первому контейнеру с помощью ```docker exec``` и создайте текстовый файл любого содержания в ```/data```.
- Добавьте ещё один файл в текущий каталог ```$(pwd)``` на хостовой машине.
- Подключитесь во второй контейнер и отобразите листинг и содержание файлов в ```/data``` контейнера.

В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод.

![image](https://github.com/user-attachments/assets/ec770758-e0d8-499e-9e8e-9dc9d5af3bec)

![image](https://github.com/user-attachments/assets/59532565-1056-4ad2-8838-fe0f2cf62ab9)

![image](https://github.com/user-attachments/assets/5f758493-140e-423c-8cf0-1b2987dd49f4)

![image](https://github.com/user-attachments/assets/8428e54b-700f-42e4-8e68-2c5fae38488f)

## Задача 5

1. Создайте отдельную директорию(например /tmp/netology/docker/task5) и 2 файла внутри него.
"compose.yaml" с содержимым:
```
version: "3"
services:
  portainer:
    image: portainer/portainer-ce:latest
    ports:
      - 8000:8000
      - 9443:9443
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```
"docker-compose.yaml" с содержимым:
```
version: "3"
services:
  registry:
    image: registry:2

    ports:
    - "5000:5000"
```

И выполните команду "docker compose up -d". Какой из файлов был запущен и почему? (подсказка: https://docs.docker.com/compose/compose-application-model/#the-compose-file )

2. Отредактируйте файл compose.yaml так, чтобы были запущенны оба файла. (подсказка: https://docs.docker.com/compose/compose-file/14-include/)

3. Выполните в консоли вашей хостовой ОС необходимые команды чтобы залить образ custom-nginx как custom-nginx:latest в запущенное вами, локальное registry. Дополнительная документация: https://distribution.github.io/distribution/about/deploying/
4. Откройте страницу "https://127.0.0.1:9000" и произведите начальную настройку portainer.(логин и пароль адмнистратора)
5. Откройте страницу "http://127.0.0.1:9000/#!/home", выберите ваше local  окружение. Перейдите на вкладку "stacks" и в "web editor" задеплойте следующий компоуз:

```
version: '3'

services:
  nginx:
    image: 127.0.0.1:5000/custom-nginx
    ports:
      - "9090:80"
```
6. Перейдите на страницу "http://127.0.0.1:9000/#!/2/docker/containers", выберите контейнер с nginx и нажмите на кнопку "inspect". В представлении <> Tree разверните поле "Config" и сделайте скриншот от поля "AppArmorProfile" до "Driver".

7. Удалите любой из манифестов компоуза(например compose.yaml).  Выполните команду "docker compose up -d". Прочитайте warning, объясните суть предупреждения и выполните предложенное действие. Погасите compose-проект ОДНОЙ(обязательно!!) командой.

В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод, файл compose.yaml , скриншот portainer c задеплоенным компоузом.

Ответ пункт 1

![image](https://github.com/user-attachments/assets/353263bb-be96-4a20-a17e-6ba81a69c83b)

Был использован compose.yaml. В документации по файлу Compose следующее.

Путь по умолчанию для файла Compose — compose.yaml (предпочтительно) или compose.yml, который находится в рабочем каталоге. Compose также поддерживает docker-compose.yaml и docker-compose.ymlдля обратной совместимости с более ранними версиями. Если существуют оба файла, Compose предпочитает канонический compose.yaml.

Т.е. в случае присутствия в каталоге фалов compose.yaml и docker-compose.yaml будет использован первый, но будет выведено предупреждение о том, что существует файл docker-compose.yaml и предложено удалить его чтобы избежать путаницы.

Ответ пункт 2

Листинг compose.yaml

```
version: "3"
include:
    - docker-compose.yaml
services:
  portainer:
    image: portainer/portainer-ce:latest
    ports:
      - 8000:8000
      - 9000:9443
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```

Ответ пункт 3

![image](https://github.com/user-attachments/assets/e1120ca4-1929-4c75-9a1d-339a602d86d9)

Ответ пункты 4-6

![image](https://github.com/user-attachments/assets/fed46cb0-1d88-41ab-8f03-06dad04786ce)

Ответ пункт 7

![image](https://github.com/user-attachments/assets/1c736c12-ee73-4dfa-9cb6-6c31da93d908)

Насколько я понимаю, в рамках задачи docker compose запускает два контейнера. После удаления compose.yaml и повторного запуска docker обнаружил лишний контейнер не указанный в конфигурационном файле - сироту и предложил исправить проблему запуском с ключом --remove-orphans. После выполнения команды с ключом --remove-orphans docker остановл контейнер не указанный в конфигурации.
Я описал свое мнение, но точного понимания ситуации у меня нет. Вы не могли бы проконсультировать меня по данному вопросу? Спасибо.

---

### Правила приема

Домашнее задание выполните в файле readme.md в GitHub-репозитории. В личном кабинете отправьте на проверку ссылку на .md-файл в вашем репозитории.
