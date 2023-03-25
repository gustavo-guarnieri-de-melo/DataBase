create table usuario (
  id_usuario number (11) constraint id_user_pk primary key,
  nome varchar(30) constraint nm_user_nn not null,
  email varchar(45) constraint email_user_nn not null,
  senha varchar(11)constraint senha_user_nn not null);

create table save (
  id_save number (11) constraint id_save_pk primary key,
  tempo_total date constraint temp_save_nn not null,
  nome_save varchar(15)constraint nm_save_nn not null,
  fk_usuario_id_usuario number(11)constraint fk_save_nn not null
  REFERENCES usuario(id_usuario)
);

create table possui (
  fk_save_id_save number (11)constraint fk_possui_pk primary key,
  fk_personagem_id_personagem number(11) constraint fkid_possui_nn not null
  REFERENCES save (id_save)
);

create table personagem (
  nome varchar(30) constraint nome_personagem_nn not null,
  nivel number (4) constraint nivel_personagem_nn not null,
  saldo number (10,2) constraint saldo_personagem_nn not null,
  id_personagem number (11) constraint is_personagem_pk primary key
  REFERENCES possui (fk_save_id_save));
  
create table tarefa (
  id_tarefa number (11) constraint id_tar_pk primary key,
  conquista varchar (15) constraint conq_tar_nn not null,
  fk_personagem_id_personagem number (11) constraint fk_tar_nn not null
  REFERENCES personagem (id_personagem));
  
create table papel_acao (
  valor number (12,2) constraint vl_pa_nn not null,
  quantidade number (10,2) constraint qtd_pa_nn not null,
  fk_personagem_id_personagem number(11) constraint fk_pq_pk primary key
  REFERENCES personagem (id_personagem));
  
create table items (
  id_item number (11) constraint id_itm_pk primary key,
  quantidade number (10,2) constraint qtd_itm_nn not null,
  valor number (12,2) constraint vl_itm_nn not null,
  fk_personagem_id_personagem number (11) constraint fkid_itm_nn not null
  REFERENCES personagem (id_personagem))