Amanhã Solidario

Descrição:
Nosso tema envolve a criação de um aplicativo que conecte ONGs, voluntários, doações e muito mais. Nós
escolheu este tema porque está diretamente alinhado com o Desenvolvimento Sustentável das Nações Unidas
(ODS), especificamente os objectivos 3 e 13. O Objectivo 3 visa garantir vidas saudáveis ​​e promover o bem-estar para todos, enquanto o objectivo 13 centra-se na acção climática. Desenvolvendo um aplicativo para facilitar isso
conexão pode ajudar a melhorar a saúde e o bem-estar da comunidade, bem como promover ações para o
meio ambiente e sustentabilidade. Devido aos desastres significativos que ocorrem em todo o mundo, incluindo
recentes no Brasil, notamos falta de preparação para atender os necessitados e falta de
uma rede de segurança para doações e até mesmo voluntariado. Portanto, criamos um aplicativo que diretamente
conecta todos os pontos-chave em uma situação de desastre, facilitando assim a ajuda no caso de uma futura
desastre, seja dentro ou fora do país.

Diagrama Conceitual:
![Imagem do WhatsApp de 2024-06-08 à(s) 17 36 28_27c5caae](https://github.com/JuniorReisx/Amanha-Solidario/assets/125107249/ac8c44e0-6492-4a35-9d98-4280de74ff66)

Diagrama Dbdiagram:

![Imagem do WhatsApp de 2024-06-08 à(s) 17 30 48_741fc539](https://github.com/JuniorReisx/Amanha-Solidario/assets/125107249/ab637b4b-ff5e-4fe4-8cae-0846224fa54f)

Diagrama Dbdiagram(codigo):
Table endereco {
  cep int [pk, not null]
  rua varchar(255) 
  municipio varchar(255) 
  bairro varchar(255) 
  lati decimal(10, 8)
  longi decimal(11, 8) 
}

Table ong {
  id_ong int [pk, not null]
  cep int
  projeto varchar(255)
  id_doacao int
  nome varchar(255)
  gestor varchar(255)
}

Table doacao {
  id_doacao int [pk, not null]
  quantidade int [not null]
  tipo varchar [not null]
  data_recebimento date [not null]
}

Table abrigo{
  id_abrigo int [pk, not null]
  nome varchar(255) [not null]
  cep char(8)
  id_ong int
  capacidade int [not null]
  gestor varchar [not null]
}

Table vitima{
  id_vitima int [pk, not null]
  cpf int
 nome varchar(255) [not null]
  genero varchar(255) [not null]
  idade int
  id_abrigo int
}

Table voluntario{
  id_voluntario int [pk, not null]
  nome varchar  [not null]
  idade int
  funcao varchar(200)  [not null]
  cpf char(11)  [not null]
  id_ong int
}


Ref: "abrigo"."cep" < "endereco"."cep"

Ref: "vitima"."id_abrigo" < "abrigo"."id_abrigo"

Ref: "ong"."cep" < "endereco"."cep"

Ref: "ong"."id_doacao" < "doacao"."id_doacao"

Ref: "abrigo"."id_ong" < "ong"."id_ong"

Ref: "voluntario"."id_ong" < "ong"."id_ong"

Graficos:
[https://1drv.ms/x/s!AoWfyR3EVJkA4gZemU_UZKax4VM2?e=uSoccr](https://1drv.ms/x/s!AoWfyR3EVJkA4gZemU_UZKax4VM2?e=uSoccr)

Slide:
  https://gamma.app/docs/Amanha-Solidario-25kmztuf4jl1wmp
