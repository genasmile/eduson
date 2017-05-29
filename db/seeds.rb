# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(login: 'user1', pass: 'pass', fio: 'Геннадий Милославский', permission: 100, active: true)
User.create(login: 'user2', pass: 'pass', fio: 'Петр Иванович', permission: 100, active: true)
User.create(login: 'user3', pass: 'pass', fio: 'Мария Федоровна', permission: 100, active: true)
User.create(login: 'admin', pass: 'root', fio: 'Цукерберг', permission: 1, active: true)

Course.create(title: 'Эффективные стили менеджмента', desc: 'Этот курс посвящен эффективным и неэффективным стилям управления.')
Course.create(title: 'Как разработать маркетинговую стратегию', desc: 'Вы узнаете, что такое матрица Ансоффа и зачем она нужна. Мы пройдём через все шаги применения матрицы и изучим несколько примеров.')
Course.create(title: 'Как отвечать на вопросы о конкурентах', desc: 'Вы находитесь на встрече с потенциальным клиентом. Он заинтересован в ваших услугах, но неожиданно задаёт серию вопросов о ваших конкурентах. Как вы поступите в этой ситуации?')

Test.create(title: 'Бизнес-английский', desc: 'Покажет Ваш уровень владения деловым английским языком.', mark_max: 30, duration: 20)
Test.create(title: 'Тайм-менеджмент', desc: 'Покажет как хорошо Вы управляете своим временем.', mark_max: 30, duration: 30)
Test.create(title: 'Microsoft Office', desc: 'Выявит Ваш уровень владения инструментами Microsoft Office.', mark_max: 30, duration: 30)