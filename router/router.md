<h3>Описание класса Router.</h3> <br>
Класс работает по следующей схеме: <br>
class Router -
1. При инициализации создается пустой хэш для маршрутов @routes
2. Суть его работы - создать маршруты CRUD для всех представленных resources  используя метод resources.
- resources(klass, keyword) - передаем имя класса klass, keyword - ключ, который будет сопоставляться с значениями хэша. CRUD реализуется через основные методы: GET, POST, PUT, DELETE.
  controller = klass.new - создаем экзэмпляр класса klass, и получаем controller = PostsController.new - объект класса PostsController.

При вызове метода resources, например с классом PostsController, и ключевым словом posts:
=> #<Router:0x0000561e49c4bc98 @routes={"posts"=>
{"GET"=>{"index"=>#<Method: PostsController#index>, "show"=>#<Method: PostsController#show>},
"POST"=>#<Method: PostsController#create>,
"PUT"=>#<Method: PostsController#update>,
"DELETE"=>#<Method: PostsController#destroy>}}>
- получаем первое маршрутное соответствие МАРШРУТ <-> ACTION
- аналогично, вызывая resources(CommentsController, 'comments') - получаем все маршруты для Comments.

<h3>Пояснение использования extend.</h3><br>

Расширяя за счет модуля Resource класс, например PostsController, получаем следующую картину:
Вызываем в цикле PostsController.connection (connection - метод модуля Resource, добавляется как метод класса 
PostsController)

В маршруте имеем записи CRUD для PostsController класса -> спрашиваем у пользователя, как он хочет 
взаимодействовать с выбранным ресурсом (GET/POST/PUT/DELETE) -> сохраняем в переменную verb -> 
Если пользователь выбрал GET, нужно уточнить экшн для GET (index/show) -> сохраняем в переменную action.
Используя verb и action -> определяем -> если action.nil? -> то есть выбрали POST, PUT, DELETE ->
делаем вызов routes[verb].call или routes[verb][action].call  - то есть формирум вызов: controller.index 
(например) - в контексте того контроллера, который мы определили в методе resources класса Router: controller = klass.new
<br>
