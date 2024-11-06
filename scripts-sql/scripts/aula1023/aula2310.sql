-- create database Aula2310;
-- use Aula2310;

/*Professor*/ 
Create table Professor (
	numprof integer not null auto_increment,
    nomeprof varchar(100),
    ruaprof varchar(100),
    cidadeprof varchar(100),

     constraint pk_numprofessor primary key (numprof)
);

/*Aluno*/ 
Create table Aluno (
	numaluno integer not null auto_increment,
    nomealuno varchar(100),
    ruaaluno varchar(100),
    cidadealuno varchar(100),

     constraint pk_numaluno primary key (numaluno)
);

/*Disciplina*/ 
Create table Disciplina (
	coddisc integer not null auto_increment,
    nomedisc varchar(100),
    nomeCurso varchar(100),
    quantaulas integer,

     constraint pk_coddisciplina primary key (coddisc)
);

/*Matricula*/ 
Create table Matricula (
    idmat integer not null auto_increment,
	numaluno integer not null,
    coddisc integer not null,
    ano varchar(4),

     constraint pk_IdMatricula primary key (idmat),
     constraint fk_numaluno_Aluno foreign key (numaluno)
		references Aluno(numaluno),
     constraint fk_coddisc_Disciplina foreign key (coddisc)
		references Disciplina(coddisc)
);

/*ProfDisciplina*/ 
Create table ProfDisciplina (
    idpd integer not null auto_increment,
    coddisc integer not null,
    numprof integer not null,
    ano varchar(4),

     constraint pk_IdPD primary key (idpd),
     
     constraint fk_coddisc_ProfDisciplina foreign key (coddisc)
		references Disciplina(coddisc),
	
    constraint fk_numprof_Professor foreign key (numprof)
		references Professor(numprof)
);
