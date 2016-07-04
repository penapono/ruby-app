## Resumo

O objetivo da aplicação é consultar marcas e modelos de carros usando a API do WebMotors.

## Objetivo

Para iniciar a aplicação, basta executar `rake db:create db:migrate db:seed`

O código no `db:seed` já importa todas as marcas e modelos dos carros na primeira
inicialização do banco, assim, não temos mais problemas de performance toda vez que a
página é carregada

Também há um cronjob para, a cada 1hr, atualizar as marcas e modelos, caso haja atualizações.

Executar `whenever --update-crontab` para gerar o cronjob que atualiza as marcas e modelos
O `schedule.rb` do whenever roda as rakes
`brands:create_or_update`
`models:create_or_update`
