# Используем официальный Docker образ Dart для сборки проекта
FROM dart:2.18 AS build

# Устанавливаем Flutter
RUN git clone https://github.com/flutter/flutter.git /flutter
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Устанавливаем Chrome для поддержки Flutter Web
RUN apt-get update && apt-get install -y wget gnupg2
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get update && apt-get install -y google-chrome-stable

# Копируем проект в контейнер
WORKDIR /app
COPY . .

# Устанавливаем зависимости и строим проект
RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web
RUN flutter pub get
RUN flutter build web

# Используем официальный Docker образ nginx для хостинга нашего веб-приложения
FROM nginx:alpine

# Копируем конфиг nginx под работу Flutter
COPY nginx.default.conf /etc/nginx/conf.d/default.conf

# Копируем собранное веб-приложение из предыдущего этапа
COPY --from=build /app/build/web /usr/share/nginx/html

# Открываем порт 80 для доступа к нашему приложению
EXPOSE 80

# Стартуем nginx
CMD ["nginx", "-g", "daemon off;"]
