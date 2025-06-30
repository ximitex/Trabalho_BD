-- 1. Quais engenheiros especialistas em "Energia Solar" têm mais de 30 anos?
SELECT nome, especialista, idade
FROM Engenheiro
WHERE especialista LIKE '%Energia Solar%' AND idade > 30
ORDER BY idade DESC;

-- 2. Qual o número total de ordens de serviço por status e criticidade?
SELECT status_ordem, criticidade, COUNT(*) as total_ordens
FROM Ordem_Servico
GROUP BY status_ordem, criticidade
ORDER BY total_ordens DESC;

-- 3. Consulta adicional: Média de idade dos engenheiros por especialização
SELECT 
    especialista, 
    AVG(idade) as media_idade,
    COUNT(*) as total_engenheiros
FROM Engenheiro
GROUP BY especialista
ORDER BY media_idade DESC;

-- 4. Consulta adicional: Detecção de possíveis problemas térmicos
SELECT 
    p.id as placa_id,
    p.diagnostico_termal,
    t.id as tracker_id,
    t.sujidade,
    ST_AsText(p.poligono) as localizacao
FROM Placa p
JOIN Tracker t ON p.tracker_id = t.id
WHERE p.diagnostico_termal = 'Hotspot' OR t.sujidade = 'sim';

-- 5. Quais placas possuem hotspots e estão em trackers sujos?
SELECT p.id, p.diagnostico_termal, t.sujidade
FROM Placa p
JOIN Tracker t ON p.tracker_id = t.id
WHERE p.diagnostico_termal = 'Hotspot' AND t.sujidade = 'sim'
LIMIT 5;

-- 6. Qual a distância média entre inversores e string boxes?
SELECT AVG(ST_Distance(
    i.localizacao, 
    s.localizacao
)) as distancia_media_metros
FROM Inversor i
JOIN String_Box s ON i.id = s.inversor_equipamento_tipo_id;

-- 7. Quais módulos estão dentro de placas com diagnóstico normal?
SELECT m.id, m.sujidade
FROM Modulo m
WHERE m.placa_id IN (
    SELECT p.id 
    FROM Placa p 
    WHERE p.diagnostico_termal = 'Normal'
)
AND ST_Within(
    m.poligono, 
    (SELECT poligono FROM Placa WHERE id = m.placa_id)
);


-- 8. Tempo médio entre ocorrência e abertura de OS por engenheiro
SELECT 
    e.nome,
    AVG(DATEDIFF(os.data_aberturaOS, os.data_ocorrido)) AS dias_atraso_medio,
    COUNT(*) AS total_ordens
FROM Ordem_Servico os
JOIN Engenheiro e ON os.engenheiro_id = e.matricula
GROUP BY e.matricula
ORDER BY dias_atraso_medio DESC;

-- 9. Análise sazonal de ordens de serviço por mês
SELECT 
    MONTH(data_ocorrido) AS mes,
    COUNT(*) AS total_ordens,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Ordem_Servico), 2) AS percentual
FROM Ordem_Servico
GROUP BY mes
ORDER BY total_ordens DESC;

-- 10. Top 5 engenheiros com mais ordens de serviço atribuídas
SELECT 
    e.nome,
    e.especialista,
    COUNT(os.numero_indisp) AS total_ordens,
    SUM(CASE WHEN os.criticidade = 'alto' THEN 1 ELSE 0 END) AS ordens_criticas
FROM Engenheiro e
LEFT JOIN Ordem_Servico os ON e.matricula = os.engenheiro_id
GROUP BY e.matricula
ORDER BY total_ordens DESC
LIMIT 5;
