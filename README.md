# AgendaPro Ruleta

Esta aplicación corre una ruleta cada 3 minutos para una cantidad de jugadores

## Requerimientos de instalación:

* Ruby version 2.4.0
* Rails version 4.2.11
* Postgres version 9.5.14

## Instalación:

* Crear database
  `psql -U Postgres`
  `CREATE USER beetrackuser WITH ENCRYPTED PASSWORD 'beetrack';`
  `ALTER USER beetrackuser CREATEDB;`

* Bajar proyecto de Github y abrir carpeta agendapro_ruleta

* Instalar gemas
  `bundle install`

* Iniciar database
  `rake db:create`
  `rake db:migrate`

* Chequear si los test estan ok
  `rspec`

* Iniciar Sidekiq
Para correr los procesos (workers) en background, correr `sidekiq` en una pestaña aparte

* Iniciar server
  `rails s`

## Controladores:

* players_controller.rb: Controlador scaffold de las vistas de los jugadores (index, new)

* roulette_controller.rb: Controlador con todo el flujo de la ruleta. Corre acada 3 minutos y es llamado por roulette_worker.rb

## Servicios:

* dark_sky_api.rb: Servicio que se conecta a DarkSky (API de clima) para detectar lluvia en los próximos días

## Workers:

* add_money_to_players_worker.rb: Worker que corre a medianoche y agrega $10.000 a cada jugador del sistema

* roulette_worker.rb: Worker principal que corre la ruleta cada 3 minutos
