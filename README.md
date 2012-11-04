# Ruscountrylist

Список стран на русском языке.
Russian country list.

## Требования
* Ruby 1.9.3 (возможо, подойдет версия старше)
* Rails 3.2 (возможо, подойдет версия старше)

## Установка

Add this line to your application's Gemfile:

    gem 'ruscountrylist'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruscountrylist

## Как использовать

### Список стран без генерации модели

В переменной содержится список стран

	Ruscountrylist::RUS_COUNTRIES

Вывести список в select можно вот так:
	
	select_tag "countries",  options_for_select(Ruscountrylist::RUS_COUNTRIES)

Получаем:

	<select id="countries" name="countries"><option value="Абхазия">Абхазия</option><option value="Австралия">Австралия</option>...</select>

###Установка с моделью по умолчанию: Country

Генерация модели и миграции

	$ rails generate ruscountrylist

Выполнение миграции

	$ rake db:migrate

Заполнение таблицы countries

	$ rake ruscountrylist:install

### Модель с другим именем
Генерируем модель с именем "mymodel":

	$ rails generate ruscountrylist --model=mymodel

Миграция:

	$ rake db:migrate

Заполняем таблицу mymodels значениями:

	$ rake ruscountrylist:install[mymodel]

### Использование после миграции

В контроллер добавляем:

	@countries = Country.all

В шаблоне (на примере slim)

	select_tag 'countries', options_from_collection_for_select(@countries, 'id', 'name')
	
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Авторы

* vasche
