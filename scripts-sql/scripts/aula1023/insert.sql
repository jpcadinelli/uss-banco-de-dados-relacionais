Use Aula2310;

insert into aluno (nomealuno, ruaaluno, cidadealuno)
values ('Maria','ABC','Vassouras');
insert into aluno (nomealuno, ruaaluno, cidadealuno)
values ('Bruna','GHY','Barra');
insert into aluno (nomealuno, ruaaluno, cidadealuno)
values ('Ana','FGH','Vassouras');
insert into aluno (nomealuno, ruaaluno, cidadealuno)
values ('José','BCD','Valença');
insert into aluno (nomealuno, ruaaluno, cidadealuno)
values ('João','DYT','Barra');

insert into professor (nomeprof, ruaprof, cidadeprof)
values ('Fabio','ABC','Volta Redonda');
insert into professor (nomeprof, ruaprof, cidadeprof)
values ('Alex','CBA','Barra');
insert into professor (nomeprof, ruaprof, cidadeprof)
values ('Alexandre','CAB','Vassouras');
insert into professor (nomeprof, ruaprof, cidadeprof)
values ('Rafael','BGT','Barra');
insert into professor (nomeprof, ruaprof, cidadeprof)
values ('Ana','YTR','Vassouras');

insert into disciplina (nomedisc, nomeCurso, Quantaulas)
values ('Algoritmos','ESW',10);
insert into disciplina (nomedisc, nomeCurso, Quantaulas)
values ('Web','ESW',15);
insert into disciplina (nomedisc, nomeCurso, Quantaulas)
values ('Anatomia I','Medicina',15);
insert into disciplina (nomedisc, nomeCurso, Quantaulas)
values ('Anatomia II','Medicina',17);
insert into disciplina (nomedisc, nomeCurso, Quantaulas)
values ('Banco de Dados','ESW',15);
insert into disciplina (nomedisc, nomeCurso, Quantaulas)
values ('Desenho Técnico','EC',15);
insert into disciplina (nomedisc, nomeCurso, Quantaulas)
values ('Instalações','EE',15);

insert into matricula (numaluno, coddisc, ano)
values (1,1,'2024');
insert into matricula (numaluno, coddisc, ano)
values (5,1,'2024');
insert into matricula (numaluno, coddisc, ano)
values (6,1,'2024');
insert into matricula (numaluno, coddisc, ano)
values (1,2,'2024');
insert into matricula (numaluno, coddisc, ano)
values (5,2,'2024');
insert into matricula (numaluno, coddisc, ano)
values (6,2,'2024');
insert into matricula (numaluno, coddisc, ano)
values (1,5,'2023');
insert into matricula (numaluno, coddisc, ano)
values (5,5,'2023');
insert into matricula (numaluno, coddisc, ano)
values (6,5,'2023');
insert into matricula (numaluno, coddisc, ano)
values (2,3,'2023');
insert into matricula (numaluno, coddisc, ano)
values (3,3,'2023');
insert into matricula (numaluno, coddisc, ano)
values (2,4,'2024');
insert into matricula (numaluno, coddisc, ano)
values (3,4,'2024');

insert into ProfDisciplina (coddisc, numprof, ano)
values (1,1,'2024');
insert into ProfDisciplina (coddisc, numprof, ano)
values (2,1,'2023');
insert into ProfDisciplina (coddisc, numprof, ano)
values (3,5,'2024');
insert into ProfDisciplina (coddisc, numprof, ano)
values (4,5,'2023');
insert into ProfDisciplina (coddisc, numprof, ano)
values (5,3,'2023');