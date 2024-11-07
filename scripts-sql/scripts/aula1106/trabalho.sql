CREATE SCHEMA aula5_trab;
USE aula5_trab;

# Questão 1:
SELECT p.nome as Paciente p.cpf as CPF
FROM paciente p
JOIN consulta c ON p.id = c.id_paciente
JOIN medico m ON c.id_medico = m.id
WHERE m.nome = 'Pedro Moraes' AND c.data = '10/07/97';

# Questão 2:
SELECT SUM(med.valor) as Total
FROM paciente p
JOIN consulta c ON p.id = c.id_paciente
JOIN receita r ON c.id = r.id_consulta
JOIN receita_medicamento rm ON r.id = rm.id_receita
JOIN medicamento med ON rm.id_medicamento = med.id
WHERE p.nome = 'Marta Silva'
    AND p.rg = '24689/RJ'
    AND c.data >= '01/04'
    AND c.data < '01/05';

# Questão 3:
SELECT med.*
FROM receita r
JOIN receita_medicamento rm ON r.id = rm.id_receita
JOIN medicamento med ON rm.id_medicamento = med.id
WHERE med.tarja = 'Preta' AND r.numero = 45123;

# Questão 4:
SELECT f.nome AS Fabricante
FROM medicamento med
JOIN fabricante f ON med.id_fabricante = f.id
WHERE med.nome = 'ASPIRINA';