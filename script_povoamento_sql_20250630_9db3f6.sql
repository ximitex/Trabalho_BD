-- Povoamento da tabela Engenheiro
INSERT INTO Engenheiro (matricula, nome, especialista, idade) VALUES
('ENG001', 'Carlos Silva', 'Energia Solar', 35),
('ENG002', 'Ana Oliveira', 'Sistemas Fotovoltaicos', 28),
('ENG003', 'Pedro Santos', 'Manutenção Industrial', 42),
('ENG004', 'Mariana Costa', 'Automação', 31),
('ENG005', 'Lucas Pereira', 'Eletricidade', 45),
('ENG006', 'Juliana Almeida', 'Segurança Elétrica', 29),
('ENG007', 'Fernando Souza', 'Energias Renováveis', 38),
('ENG008', 'Patrícia Lima', 'Gestão de Projetos', 40),
('ENG009', 'Ricardo Martins', 'Manutenção Preventiva', 33),
('ENG010', 'Camila Rocha', 'Sistemas de Potência', 36);

-- Povoamento da tabela Ordem_Servico
INSERT INTO Ordem_Servico (numero_indisp, data_aberturaOS, data_ocorrido, status_ordem, criticidade, engenheiro_id) VALUES
('OS001', '2023-01-15', '2023-01-10', 'Em andamento', 'medio', 'ENG001'),
('OS002', '2023-02-20', '2023-02-18', 'Concluída', 'baixo', 'ENG002'),
('OS003', '2023-03-05', '2023-03-01', 'Concluída', 'alto', 'ENG003'),
('OS004', '2023-04-10', '2023-04-08', 'Em andamento', 'medio', 'ENG004'),
('OS005', '2023-05-12', '2023-05-10', 'Pendente', 'alto', 'ENG005'),
('OS006', '2023-06-18', '2023-06-15', 'Concluída', 'baixo', 'ENG006'),
('OS007', '2023-07-22', '2023-07-20', 'Em andamento', 'medio', 'ENG007'),
('OS008', '2023-08-30', '2023-08-28', 'Concluída', 'baixo', 'ENG008'),
('OS009', '2023-09-05', '2023-09-01', 'Pendente', 'alto', 'ENG009'),
('OS010', '2023-10-12', '2023-10-10', 'Em andamento', 'medio', 'ENG010');

-- Povoamento da tabela Tipo
INSERT INTO Tipo (id, nome, status, capacidade, ordem_servico_id) VALUES
('T001', 'Painel Solar', 'Operante', '300W', 'OS001'),
('T002', 'Inversor', 'Operante', '5kW', 'OS002'),
('T003', 'Tracker', 'Inoperante', 'N/A', 'OS003'),
('T004', 'String Box', 'Operante', '1kV', 'OS004'),
('T005', 'Eletrocentro', 'Operante', '100kW', 'OS005'),
('T006', 'Módulo Fotovoltaico', 'Inoperante', '50W', 'OS006'),
('T007', 'Subestação', 'Operante', '1MW', 'OS007'),
('T008', 'Placa de Controle', 'Operante', 'N/A', 'OS008'),
('T009', 'Cabo Solar', 'Operante', '1000V', 'OS009'),
('T010', 'Estrutura de Suporte', 'Inoperante', 'N/A', 'OS010');

-- Povoamento da tabela OS_Tipo
INSERT INTO OS_Tipo (numero_indisp, tipo_id) VALUES
('OS001', 'T001'),
('OS002', 'T002'),
('OS003', 'T003'),
('OS004', 'T004'),
('OS005', 'T005'),
('OS006', 'T006'),
('OS007', 'T007'),
('OS008', 'T008'),
('OS009', 'T009'),
('OS010', 'T010');

-- Povoamento da tabela Equipamento
INSERT INTO Equipamento (id, nome, status, capacidade, tipo, marca, modelo, data_instalacao, tipo_id) VALUES
('EQ001', 'Painel Solar A', 'Operante', '300W', 'Fotovoltaico', 'SunPower', 'SPR-300', '2022-01-15', 'T001'),
('EQ002', 'Inversor X', 'Operante', '5kW', 'Conversor', 'SMA', 'Sunny Boy', '2022-02-20', 'T002'),
('EQ003', 'Tracker B', 'Inoperante', 'N/A', 'Mecânico', 'ArrayTech', 'ATI-100', '2022-03-10', 'T003'),
('EQ004', 'String Box Y', 'Operante', '1kV', 'Proteção', 'Phoenix', 'PSB-1000', '2022-04-05', 'T004'),
('EQ005', 'Eletrocentro Z', 'Operante', '100kW', 'Distribuição', 'Siemens', 'SICAM', '2022-05-12', 'T005'),
('EQ006', 'Módulo C', 'Inoperante', '50W', 'Fotovoltaico', 'LG', 'NeON 2', '2022-06-18', 'T006'),
('EQ007', 'Subestação N', 'Operante', '1MW', 'Transformação', 'ABB', 'MNS', '2022-07-22', 'T007'),
('EQ008', 'Placa D', 'Operante', 'N/A', 'Controle', 'Schneider', 'Altivar', '2022-08-30', 'T008'),
('EQ009', 'Cabo E', 'Operante', '1000V', 'Condutor', 'Prysmian', 'Solar Cable', '2022-09-05', 'T009'),
('EQ010', 'Estrutura F', 'Inoperante', 'N/A', 'Suporte', 'Unirac', 'SolarMount', '2022-10-12', 'T010');

-- Povoamento da tabela Zona (com dados geoespaciais)
INSERT INTO Zona (id, nome, status, capacidade, poligono, localizacao, data_criacao, tipo_id) VALUES
('Z001', 'Zona Norte', 'Operante', '1MW', ST_GeomFromText('POLYGON((-47.9297 -15.7942, -47.9290 -15.7942, -47.9290 -15.7935, -47.9297 -15.7935, -47.9297 -15.7942))'), ST_GeomFromText('POINT(-47.9293 -15.7938)'), '2022-01-10', 'T001'),
('Z002', 'Zona Sul', 'Operante', '1.2MW', ST_GeomFromText('POLYGON((-47.9300 -15.7950, -47.9293 -15.7950, -47.9293 -15.7943, -47.9300 -15.7943, -47.9300 -15.7950))'), ST_GeomFromText('POINT(-47.9296 -15.7946)'), '2022-02-15', 'T002'),
('Z003', 'Zona Leste', 'Inoperante', '0.8MW', ST_GeomFromText('POLYGON((-47.9280 -15.7940, -47.9273 -15.7940, -47.9273 -15.7933, -47.9280 -15.7933, -47.9280 -15.7940))'), ST_GeomFromText('POINT(-47.9276 -15.7936)'), '2022-03-20', 'T003'),
('Z004', 'Zona Oeste', 'Operante', '1.5MW', ST_GeomFromText('POLYGON((-47.9310 -15.7930, -47.9303 -15.7930, -47.9303 -15.7923, -47.9310 -15.7923, -47.9310 -15.7930))'), ST_GeomFromText('POINT(-47.9306 -15.7926)'), '2022-04-25', 'T004'),
('Z005', 'Zona Central', 'Operante', '2MW', ST_GeomFromText('POLYGON((-47.9295 -15.7930, -47.9288 -15.7930, -47.9288 -15.7923, -47.9295 -15.7923, -47.9295 -15.7930))'), ST_GeomFromText('POINT(-47.9291 -15.7926)'), '2022-05-30', 'T005'),
('Z006', 'Zona Industrial', 'Inoperante', '1MW', ST_GeomFromText('POLYGON((-47.9270 -15.7920, -47.9263 -15.7920, -47.9263 -15.7913, -47.9270 -15.7913, -47.9270 -15.7920))'), ST_GeomFromText('POINT(-47.9266 -15.7916)'), '2022-06-05', 'T006'),
('Z007', 'Zona Residencial', 'Operante', '0.5MW', ST_GeomFromText('POLYGON((-47.9300 -15.7910, -47.9293 -15.7910, -47.9293 -15.7903, -47.9300 -15.7903, -47.9300 -15.7910))'), ST_GeomFromText('POINT(-47.9296 -15.7906)'), '2022-07-10', 'T007'),
('Z008', 'Zona Comercial', 'Operante', '0.7MW', ST_GeomFromText('POLYGON((-47.9280 -15.7900, -47.9273 -15.7900, -47.9273 -15.7893, -47.9280 -15.7893, -47.9280 -15.7900))'), ST_GeomFromText('POINT(-47.9276 -15.7896)'), '2022-08-15', 'T008'),
('Z009', 'Zona Rural', 'Inoperante', '0.3MW', ST_GeomFromText('POLYGON((-47.9310 -15.7890, -47.9303 -15.7890, -47.9303 -15.7883, -47.9310 -15.7883, -47.9310 -15.7890))'), ST_GeomFromText('POINT(-47.9306 -15.7886)'), '2022-09-20', 'T009'),
('Z010', 'Zona Especial', 'Operante', '1.8MW', ST_GeomFromText('POLYGON((-47.9290 -15.7880, -47.9283 -15.7880, -47.9283 -15.7873, -47.9290 -15.7873, -47.9290 -15.7880))'), ST_GeomFromText('POINT(-47.9286 -15.7876)'), '2022-10-25', 'T010');

-- Povoamento da tabela Complexo (com dados geoespaciais)
INSERT INTO Complexo (id, nome, status, capacidade, poligono, localizacao, data_criacao, observacao, pais, estado, bairro, logradouro, cidade, zona_id) VALUES
('C001', 'Complexo Solar Norte', 'Operante', '10MW', ST_GeomFromText('POLYGON((-47.9297 -15.7942, -47.9290 -15.7942, -47.9290 -15.7935, -47.9297 -15.7935, -47.9297 -15.7942))'), ST_GeomFromText('POINT(-47.9293 -15.7938)'), '2022-01-05', 'Principal complexo da região', 'Brasil', 'Goiás', 'Setor Norte', 'Rua das Palmeiras', 'Goiânia', 'Z001'),
('C002', 'Complexo Solar Sul', 'Operante', '12MW', ST_GeomFromText('POLYGON((-47.9300 -15.7950, -47.9293 -15.7950, -47.9293 -15.7943, -47.9300 -15.7943, -47.9300 -15.7950))'), ST_GeomFromText('POINT(-47.9296 -15.7946)'), '2022-02-10', 'Complexo com alta eficiência', 'Brasil', 'Goiás', 'Setor Sul', 'Avenida Solar', 'Goiânia', 'Z002'),
('C003', 'Complexo Solar Leste', 'Inoperante', '8MW', ST_GeomFromText('POLYGON((-47.9280 -15.7940, -47.9273 -15.7940, -47.9273 -15.7933, -47.9280 -15.7933, -47.9280 -15.7940))'), ST_GeomFromText('POINT(-47.9276 -15.7936)'), '2022-03-15', 'Em manutenção', 'Brasil', 'Goiás', 'Setor Leste', 'Rua dos Girassóis', 'Goiânia', 'Z003'),
('C004', 'Complexo Solar Oeste', 'Operante', '15MW', ST_GeomFromText('POLYGON((-47.9310 -15.7930, -47.9303 -15.7930, -47.9303 -15.7923, -47.9310 -15.7923, -47.9310 -15.7930))'), ST_GeomFromText('POINT(-47.9306 -15.7926)'), '2022-04-20', 'Maior complexo da cidade', 'Brasil', 'Goiás', 'Setor Oeste', 'Avenida das Flores', 'Goiânia', 'Z004'),
('C005', 'Complexo Solar Central', 'Operante', '20MW', ST_GeomFromText('POLYGON((-47.9295 -15.7930, -47.9288 -15.7930, -47.9288 -15.7923, -47.9295 -15.7923, -47.9295 -15.7930))'), ST_GeomFromText('POINT(-47.9291 -15.7926)'), '2022-05-25', 'Complexo mais moderno', 'Brasil', 'Goiás', 'Centro', 'Rua Central', 'Goiânia', 'Z005'),
('C006', 'Complexo Industrial', 'Inoperante', '10MW', ST_GeomFromText('POLYGON((-47.9270 -15.7920, -47.9263 -15.7920, -47.9263 -15.7913, -47.9270 -15.7913, -47.9270 -15.7920))'), ST_GeomFromText('POINT(-47.9266 -15.7916)'), '2022-06-30', 'Desativado temporariamente', 'Brasil', 'Goiás', 'Industrial', 'Avenida das Indústrias', 'Goiânia', 'Z006'),
('C007', 'Complexo Residencial', 'Operante', '5MW', ST_GeomFromText('POLYGON((-47.9300 -15.7910, -47.9293 -15.7910, -47.9293 -15.7903, -47.9300 -15.7903, -47.9300 -15.7910))'), ST_GeomFromText('POINT(-47.9296 -15.7906)'), '2022-07-05', 'Atende área residencial', 'Brasil', 'Goiás', 'Residencial', 'Rua das Casas', 'Goiânia', 'Z007'),
('C008', 'Complexo Comercial', 'Operante', '7MW', ST_GeomFromText('POLYGON((-47.9280 -15.7900, -47.9273 -15.7900, -47.9273 -15.7893, -47.9280 -15.7893, -47.9280 -15.7900))'), ST_GeomFromText('POINT(-47.9276 -15.7896)'), '2022-08-10', 'Abastece área comercial', 'Brasil', 'Goiás', 'Comercial', 'Avenida do Comércio', 'Goiânia', 'Z008'),
('C009', 'Complexo Rural', 'Inoperante', '3MW', ST_GeomFromText('POLYGON((-47.9310 -15.7890, -47.9303 -15.7890, -47.9303 -15.7883, -47.9310 -15.7883, -47.9310 -15.7890))'), ST_GeomFromText('POINT(-47.9306 -15.7886)'), '2022-09-15', 'Área rural', 'Brasil', 'Goiás', 'Rural', 'Estrada Rural', 'Goiânia', 'Z009'),
('C010', 'Complexo Especial', 'Operante', '18MW', ST_GeomFromText('POLYGON((-47.9290 -15.7880, -47.9283 -15.7880, -47.9283 -15.7873, -47.9290 -15.7873, -47.9290 -15.7880))'), ST_GeomFromText('POINT(-47.9286 -15.7876)'), '2022-10-20', 'Tecnologia avançada', 'Brasil', 'Goiás', 'Especial', 'Alameda Tecnológica', 'Goiânia', 'Z010');

-- Povoamento da tabela Parque (com dados geoespaciais)
INSERT INTO Parque (id, nome, descricao, status, capacidade, poligono, localizacao, data_criacao, fuso, complexo_id, zona_id) VALUES
('P001', 'Parque Solar Alfa', 'Parque principal do complexo norte', 'Operante', '2MW', ST_GeomFromText('POLYGON((-47.9297 -15.7942, -47.9290 -15.7942, -47.9290 -15.7935, -47.9297 -15.7935, -47.9297 -15.7942))'), ST_GeomFromText('POINT(-47.9293 -15.7938)'), '2022-01-10', 'UTC-3', 'C001', 'Z001'),
('P002', 'Parque Solar Beta', 'Parque secundário do complexo sul', 'Operante', '3MW', ST_GeomFromText('POLYGON((-47.9300 -15.7950, -47.9293 -15.7950, -47.9293 -15.7943, -47.9300 -15.7943, -47.9300 -15.7950))'), ST_GeomFromText('POINT(-47.9296 -15.7946)'), '2022-02-15', 'UTC-3', 'C002', 'Z002'),
('P003', 'Parque Solar Gama', 'Parque em manutenção', 'Inoperante', '1.5MW', ST_GeomFromText('POLYGON((-47.9280 -15.7940, -47.9273 -15.7940, -47.9273 -15.7933, -47.9280 -15.7933, -47.9280 -15.7940))'), ST_GeomFromText('POINT(-47.9276 -15.7936)'), '2022-03-20', 'UTC-3', 'C003', 'Z003'),
('P004', 'Parque Solar Delta', 'Maior parque do complexo oeste', 'Operante', '5MW', ST_GeomFromText('POLYGON((-47.9310 -15.7930, -47.9303 -15.7930, -47.9303 -15.7923, -47.9310 -15.7923, -47.9310 -15.7930))'), ST_GeomFromText('POINT(-47.9306 -15.7926)'), '2022-04-25', 'UTC-3', 'C004', 'Z004'),
('P005', 'Parque Solar Épsilon', 'Parque central moderno', 'Operante', '4MW', ST_GeomFromText('POLYGON((-47.9295 -15.7930, -47.9288 -15.7930, -47.9288 -15.7923, -47.9295 -15.7923, -47.9295 -15.7930))'), ST_GeomFromText('POINT(-47.9291 -15.7926)'), '2022-05-30', 'UTC-3', 'C005', 'Z005'),
('P006', 'Parque Industrial', 'Parque desativado temporariamente', 'Inoperante', '2MW', ST_GeomFromText('POLYGON((-47.9270 -15.7920, -47.9263 -15.7920, -47.9263 -15.7913, -47.9270 -15.7913, -47.9270 -15.7920))'), ST_GeomFromText('POINT(-47.9266 -15.7916)'), '2022-06-05', 'UTC-3', 'C006', 'Z006'),
('P007', 'Parque Residencial', 'Parque para área residencial', 'Operante', '1MW', ST_GeomFromText('POLYGON((-47.9300 -15.7910, -47.9293 -15.7910, -47.9293 -15.7903, -47.9300 -15.7903, -47.9300 -15.7910))'), ST_GeomFromText('POINT(-47.9296 -15.7906)'), '2022-07-10', 'UTC-3', 'C007', 'Z007'),
('P008', 'Parque Comercial', 'Parque para área comercial', 'Operante', '1.5MW', ST_GeomFromText('POLYGON((-47.9280 -15.7900, -47.9273 -15.7900, -47.9273 -15.7893, -47.9280 -15.7893, -47.9280 -15.7900))'), ST_GeomFromText('POINT(-47.9276 -15.7896)'), '2022-08-15', 'UTC-3', 'C008', 'Z008'),
('P009', 'Parque Rural', 'Parque para área rural', 'Inoperante', '0.5MW', ST_GeomFromText('POLYGON((-47.9310 -15.7890, -47.9303 -15.7890, -47.9303 -15.7883, -47.9310 -15.7883, -47.9310 -15.7890))'), ST_GeomFromText('POINT(-47.9306 -15.7886)'), '2022-09-20', 'UTC-3', 'C009', 'Z009'),
('P010', 'Parque Tecnológico', 'Parque com tecnologia avançada', 'Operante', '3.5MW', ST_GeomFromText('POLYGON((-47.9290 -15.7880, -47.9283 -15.7880, -47.9283 -15.7873, -47.9290 -15.7873, -47.9290 -15.7880))'), ST_GeomFromText('POINT(-47.9286 -15.7876)'), '2022-10-25', 'UTC-3', 'C010', 'Z010');

-- Povoamento da tabela Eletrocentro (com dados geoespaciais)
INSERT INTO Eletrocentro (id, nome, marca, descricao, status, capacidade, poligono, localizacao, data_criacao, transmissao, parque_id, zona_id) VALUES
('E001', 'Eletrocentro Norte', 'Siemens', 'Principal eletrocentro da zona norte', 'Operante', '100kW', ST_GeomFromText('POLYGON((-47.9297 -15.7942, -47.9290 -15.7942, -47.9290 -15.7935, -47.9297 -15.7935, -47.9297 -15.7942))'), ST_GeomFromText('POINT(-47.9293 -15.7938)'), '2022-01-15', 'Cabos subterrâneos', 'P001', 'Z001'),
('E002', 'Eletrocentro Sul', 'ABB', 'Eletrocentro secundário da zona sul', 'Operante', '120kW', ST_GeomFromText('POLYGON((-47.9300 -15.7950, -47.9293 -15.7950, -47.9293 -15.7943, -47.9300 -15.7943, -47.9300 -15.7950))'), ST_GeomFromText('POINT(-47.9296 -15.7946)'), '2022-02-20', 'Cabos aéreos', 'P002', 'Z002'),
('E003', 'Eletrocentro Leste', 'GE', 'Eletrocentro em manutenção', 'Inoperante', '80kW', ST_GeomFromText('POLYGON((-47.9280 -15.7940, -47.9273 -15.7940, -47.9273 -15.7933, -47.9280 -15.7933, -47.9280 -15.7940))'), ST_GeomFromText('POINT(-47.9276 -15.7936)'), '2022-03-25', 'Cabos subterrâneos', 'P003', 'Z003'),
('E004', 'Eletrocentro Oeste', 'Schneider', 'Maior eletrocentro da zona oeste', 'Operante', '150kW', ST_GeomFromText('POLYGON((-47.9310 -15.7930, -47.9303 -15.7930, -47.9303 -15.7923, -47.9310 -15.7923, -47.9310 -15.7930))'), ST_GeomFromText('POINT(-47.9306 -15.7926)'), '2022-04-30', 'Cabos aéreos', 'P004', 'Z004'),
('E005', 'Eletrocentro Central', 'WEG', 'Eletrocentro moderno da zona central', 'Operante', '200kW', ST_GeomFromText('POLYGON((-47.9295 -15.7930, -47.9288 -15.7930, -47.9288 -15.7923, -47.9295 -15.7923, -47.9295 -15.7930))'), ST_GeomFromText('POINT(-47.9291 -15.7926)'), '2022-06-05', 'Cabos subterrâneos', 'P005', 'Z005'),
('E006', 'Eletrocentro Industrial', 'Toshiba', 'Eletrocentro desativado', 'Inoperante', '100kW', ST_GeomFromText('POLYGON((-47.9270 -15.7920, -47.9263 -15.7920, -47.9263 -15.7913, -47.9270 -15.7913, -47.9270 -15.7920))'), ST_GeomFromText('POINT(-47.9266 -15.7916)'), '2022-07-10', 'Cabos aéreos', 'P006', 'Z006'),
('E007', 'Eletrocentro Residencial', 'Eaton', 'Eletrocentro para área residencial', 'Operante', '50kW', ST_GeomFromText('POLYGON((-47.9300 -15.7910, -47.9293 -15.7910, -47.9293 -15.7903, -47.9300 -15.7903, -47.9300 -15.7910))'), ST_GeomFromText('POINT(-47.9296 -15.7906)'), '2022-08-15', 'Cabos subterrâneos', 'P007', 'Z007'),
('E008', 'Eletrocentro Comercial', 'Legrand', 'Eletrocentro para área comercial', 'Operante', '70kW', ST_GeomFromText('POLYGON((-47.9280 -15.7900, -47.9273 -15.7900, -47.9273 -15.7893, -47.9280 -15.7893, -47.9280 -15.7900))'), ST_GeomFromText('POINT(-47.9276 -15.7896)'), '2022-09-20', 'Cabos aéreos', 'P008', 'Z008'),
('E009', 'Eletrocentro Rural', 'Hubbell', 'Eletrocentro para área rural', 'Inoperante', '30kW', ST_GeomFromText('POLYGON((-47.9310 -15.7890, -47.9303 -15.7890, -47.9303 -15.7883, -47.9310 -15.7883, -47.9310 -15.7890))'), ST_GeomFromText('POINT(-47.9306 -15.7886)'), '2022-10-25', 'Cabos subterrâneos', 'P009', 'Z009'),
('E010', 'Eletrocentro Especial', 'Siemens', 'Eletrocentro com tecnologia avançada', 'Operante', '180kW', ST_GeomFromText('POLYGON((-47.9290 -15.7880, -47.9283 -15.7880, -47.9283 -15.7873, -47.9290 -15.7873, -47.9290 -15.7880))'), ST_GeomFromText('POINT(-47.9286 -15.7876)'), '2022-11-30', 'Cabos aéreos', 'P010', 'Z010');

-- Povoamento da tabela Inversor (com dados geoespaciais)
INSERT INTO Inversor (id, nome, status, capacidade, tipo, marca, modelo, data_instalacao, ponto, localizacao, eletrocentro_id, equipamento_id) VALUES
('I001', 'Inversor Norte 1', 'Operante', '5kW', 'String', 'SMA', 'Sunny Tripower', '2022-01-20', ST_GeomFromText('POINT(-47.9294 -15.7939)'), ST_GeomFromText('POINT(-47.9294 -15.7939)'), 'E001', 'EQ002'),
('I002', 'Inversor Sul 1', 'Operante', '5kW', 'String', 'Fronius', 'Symo', '2022-02-25', ST_GeomFromText('POINT(-47.9297 -15.7947)'), ST_GeomFromText('POINT(-47.9297 -15.7947)'), 'E002', 'EQ002'),
('I003', 'Inversor Leste 1', 'Inoperante', '5kW', 'String', 'Huawei', 'SUN2000', '2022-03-30', ST_GeomFromText('POINT(-47.9277 -15.7937)'), ST_GeomFromText('POINT(-47.9277 -15.7937)'), 'E003', 'EQ002'),
('I004', 'Inversor Oeste 1', 'Operante', '5kW', 'String', 'SolarEdge', 'SE', '2022-05-05', ST_GeomFromText('POINT(-47.9307 -15.7927)'), ST_GeomFromText('POINT(-47.9307 -15.7927)'), 'E004', 'EQ002'),
('I005', 'Inversor Central 1', 'Operante', '5kW', 'String', 'Growatt', 'MIN', '2022-06-10', ST_GeomFromText('POINT(-47.9292 -15.7927)'), ST_GeomFromText('POINT(-47.9292 -15.7927)'), 'E005', 'EQ002'),
('I006', 'Inversor Industrial 1', 'Inoperante', '5kW', 'String', 'GoodWe', 'GW', '2022-07-15', ST_GeomFromText('POINT(-47.9267 -15.7917)'), ST_GeomFromText('POINT(-47.9267 -15.7917)'), 'E006', 'EQ002'),
('I007', 'Inversor Residencial 1', 'Operante', '5kW', 'String', 'Victron', 'MultiPlus', '2022-08-20', ST_GeomFromText('POINT(-47.9297 -15.7907)'), ST_GeomFromText('POINT(-47.9297 -15.7907)'), 'E007', 'EQ002'),
('I008', 'Inversor Comercial 1', 'Operante', '5kW', 'String', 'Delta', 'RPI', '2022-09-25', ST_GeomFromText('POINT(-47.9277 -15.7897)'), ST_GeomFromText('POINT(-47.9277 -15.7897)'), 'E008', 'EQ002'),
('I009', 'Inversor Rural 1', 'Inoperante', '5kW', 'String', 'Solis', 'S6', '2022-10-30', ST_GeomFromText('POINT(-47.9307 -15.7887)'), ST_GeomFromText('POINT(-47.9307 -15.7887)'), 'E009', 'EQ002'),
('I010', 'Inversor Especial 1', 'Operante', '5kW', 'String', 'Kaco', 'blueplanet', '2022-12-05', ST_GeomFromText('POINT(-47.9287 -15.7877)'), ST_GeomFromText('POINT(-47.9287 -15.7877)'), 'E010', 'EQ002');

-- Povoamento da tabela String_Box (com dados geoespaciais)
INSERT INTO String_Box (id, nome, status, capacidade, tipo, marca, modelo, data_instalacao, ponto, localizacao, inversor_id, equipamento_id) VALUES
('SB001', 'String Box Norte 1', 'Operante', '1kV', 'CC', 'Phoenix', 'PSB-1000', '2022-01-25', 1, ST_GeomFromText('POINT(-47.9295 -15.7940)'), 'I001', 'EQ004'),
('SB002', 'String Box Sul 1', 'Operante', '1kV', 'CC', 'Siemens', 'SENTRON', '2022-03-01', 1, ST_GeomFromText('POINT(-47.9298 -15.7948)'), 'I002', 'EQ004'),
('SB003', 'String Box Leste 1', 'Inoperante', '1kV', 'CC', 'ABB', 'Tmax', '2022-04-05', 1, ST_GeomFromText('POINT(-47.9278 -15.7938)'), 'I003', 'EQ004'),
('SB004', 'String Box Oeste 1', 'Operante', '1kV', 'CC', 'Eaton', 'PowerXL', '2022-05-10', 1, ST_GeomFromText('POINT(-47.9308 -15.7928)'), 'I004', 'EQ004'),
('SB005', 'String Box Central 1', 'Operante', '1kV', 'CC', 'Schneider', 'Acti9', '2022-06-15', 1, ST_GeomFromText('POINT(-47.9293 -15.7928)'), 'I005', 'EQ004'),
('SB006', 'String Box Industrial 1', 'Inoperante', '1kV', 'CC', 'Legrand', 'DX3', '2022-07-20', 1, ST_GeomFromText('POINT(-47.9268 -15.7918)'), 'I006', 'EQ004'),
('SB007', 'String Box Residencial 1', 'Operante', '1kV', 'CC', 'Hager', 'SFT', '2022-08-25', 1, ST_GeomFromText('POINT(-47.9298 -15.7908)'), 'I007', 'EQ004'),
('SB008', 'String Box Comercial 1', 'Operante', '1kV', 'CC', 'GE', 'TED', '2022-09-30', 1, ST_GeomFromText('POINT(-47.9278 -15.7898)'), 'I008', 'EQ004'),
('SB009', 'String Box Rural 1', 'Inoperante', '1kV', 'CC', 'WEG', 'WIS', '2022-11-05', 1, ST_GeomFromText('POINT(-47.9308 -15.7888)'), 'I009', 'EQ004'),
('SB010', 'String Box Especial 1', 'Operante', '1kV', 'CC', 'Chint', 'NB1', '2022-12-10', 1, ST_GeomFromText('POINT(-47.9288 -15.7878)'), 'I010', 'EQ004');

-- Povoamento da tabela Tracker (com dados geoespaciais)
INSERT INTO Tracker (id, nome, status, capacidade, tipo, marca, modelo, data_instalacao, sujidade, linha, localizacao, stringbox_id, equipamento_id) VALUES
('T001', 'Tracker Norte 1', 'Operante', 'N/A', 'Eixo Simples', 'ArrayTech', 'ATI-100', '2022-02-05', 'não', ST_GeomFromText('LINESTRING(-47.9295 -15.7940, -47.9296 -15.7940)'), ST_GeomFromText('POINT(-47.92955 -15.7940)'), 'SB001', 'EQ003'),
('T002', 'Tracker Sul 1', 'Operante', 'N/A', 'Eixo Duplo', 'NEXTracker', 'NX Horizon', '2022-03-10', 'não', ST_GeomFromText('LINESTRING(-47.9298 -15.7948, -47.9299 -15.7948)'), ST_GeomFromText('POINT(-47.92985 -15.7948)'), 'SB002', 'EQ003'),
('T003', 'Tracker Leste 1', 'Inoperante', 'N/A', 'Eixo Simples', 'GameChange', 'Genius', '2022-04-15', 'sim', ST_GeomFromText('LINESTRING(-47.9278 -15.7938, -47.9279 -15.7938)'), ST_GeomFromText('POINT(-47.92785 -15.7938)'), 'SB003', 'EQ003'),
('T004', 'Tracker Oeste 1', 'Operante', 'N/A', 'Eixo Duplo', 'PVH', 'SunFollower', '2022-05-20', 'não', ST_GeomFromText('LINESTRING(-47.9308 -15.7928, -47.9309 -15.7928)'), ST_GeomFromText('POINT(-47.93085 -15.7928)'), 'SB004', 'EQ003'),
('T005', 'Tracker Central 1', 'Operante', 'N/A', 'Eixo Simples', 'Soltec', 'SF7', '2022-06-25', 'não', ST_GeomFromText('LINESTRING(-47.9293 -15.7928, -47.9294 -15.7928)'), ST_GeomFromText('POINT(-47.92935 -15.7928)'), 'SB005', 'EQ003'),
('T006', 'Tracker Industrial 1', 'Inoperante', 'N/A', 'Eixo Duplo', 'Arctech', 'SkyLine', '2022-07-30', 'sim', ST_GeomFromText('LINESTRING(-47.9268 -15.7918, -47.9269 -15.7918)'), ST_GeomFromText('POINT(-47.92685 -15.7918)'), 'SB006', 'EQ003'),
('T007', 'Tracker Residencial 1', 'Operante', 'N/A', 'Eixo Simples', 'Ideematec', 'DynaTrack', '2022-09-05', 'não', ST_GeomFromText('LINESTRING(-47.9298 -15.7908, -47.9299 -15.7908)'), ST_GeomFromText('POINT(-47.92985 -15.7908)'), 'SB007', 'EQ003'),
('T008', 'Tracker Comercial 1', 'Operante', 'N/A', 'Eixo Duplo', 'Convert', 'OmniTrack', '2022-10-10', 'não', ST_GeomFromText('LINESTRING(-47.9278 -15.7898, -47.9279 -15.7898)'), ST_GeomFromText('POINT(-47.92785 -15.7898)'), 'SB008', 'EQ003'),
('T009', 'Tracker Rural 1', 'Inoperante', 'N/A', 'Eixo Simples', 'Mecasolar', 'MPT', '2022-11-15', 'sim', ST_GeomFromText('LINESTRING(-47.9308 -15.7888, -47.9309 -15.7888)'), ST_GeomFromText('POINT(-47.93085 -15.7888)'), 'SB009', 'EQ003'),
('T010', 'Tracker Especial 1', 'Operante', 'N/A', 'Eixo Duplo', 'SolarSteel', 'T0', '2022-12-20', 'não', ST_GeomFromText('LINESTRING(-47.9288 -15.7878, -47.9289 -15.7878)'), ST_GeomFromText('POINT(-47.92885 -15.7878)'), 'SB010', 'EQ003');

-- Povoamento da tabela Placa (com dados geoespaciais) 
INSERT INTO Placa (id, nome, status, capacidade, tipo, marca, modelo, data_instalacao, diagnostico_termal, poligono, tracker_id, equipamento_id) VALUES
('PL001', 'Placa Norte 1', 'Operante', '300W', 'Monocristalino', 'SunPower', 'SPR-X22-360', '2022-02-10', 'Normal', ST_GeomFromText('POLYGON((-47.92955 -15.7940, -47.92950 -15.7940, -47.92950 -15.7939, -47.92955 -15.7939, -47.92955 -15.7940))'), 'T001', 'EQ001'),
('PL002', 'Placa Sul 1', 'Operante', '300W', 'Policristalino', 'LG', 'NeON 2', '2022-03-15', 'Normal', ST_GeomFromText('POLYGON((-47.92985 -15.7948, -47.92980 -15.7948, -47.92980 -15.7947, -47.92985 -15.7947, -47.92985 -15.7948))'), 'T002', 'EQ001'),
('PL003', 'Placa Leste 1', 'Inoperante', '300W', 'Monocristalino', 'Panasonic', 'HIT', '2022-04-20', 'Hotspot', ST_GeomFromText('POLYGON((-47.92785 -15.7938, -47.92780 -15.7938, -47.92780 -15.7937, -47.92785 -15.7937, -47.92785 -15.7938))'), 'T003', 'EQ001'),
('PL004', 'Placa Oeste 1', 'Operante', '300W', 'Policristalino', 'Canadian Solar', 'HiDM', '2022-05-25', 'Normal', ST_GeomFromText('POLYGON((-47.93085 -15.7928, -47.93080 -15.7928, -47.93080 -15.7927, -47.93085 -15.7927, -47.93085 -15.7928))'), 'T004', 'EQ001'),
('PL005', 'Placa Central 1', 'Operante', '300W', 'Monocristalino', 'Jinko Solar', 'Tiger', '2022-07-01', 'Normal', ST_GeomFromText('POLYGON((-47.92935 -15.7928, -47.92930 -15.7928, -47.92930 -15.7927, -47.92935 -15.7927, -47.92935 -15.7928))'), 'T005', 'EQ001'),
('PL006', 'Placa Industrial 1', 'Inoperante', '300W', 'Policristalino', 'Trina Solar', 'Vertex', '2022-08-05', 'Hotspot', ST_GeomFromText('POLYGON((-47.92685 -15.7918, -47.92680 -15.7918, -47.92680 -15.7917, -47.92685 -15.7917, -47.92685 -15.7918))'), 'T006', 'EQ001'),
('PL007', 'Placa Residencial 1', 'Operante', '300W', 'Monocristalino', 'LONGi', 'Hi-MO 4', '2022-09-10', 'Normal', ST_GeomFromText('POLYGON((-47.92985 -15.7908, -47.92980 -15.7908, -47.92980 -15.7907, -47.92985 -15.7907, -47.92985 -15.7908))'), 'T007', 'EQ001'),
('PL008', 'Placa Comercial 1', 'Operante', '300W', 'Policristalino', 'JA Solar', 'DeepBlue 3.0', '2022-10-15', 'Normal', ST_GeomFromText('POLYGON((-47.92785 -15.7898, -47.92780 -15.7898, -47.92780 -15.7897, -47.92785 -15.7897, -47.92785 -15.7898))'), 'T008', 'EQ001'),
('PL009', 'Placa Rural 1', 'Inoperante', '300W', 'Monocristalino', 'Risen Energy', 'Titan', '2022-11-20', 'Hotspot', ST_GeomFromText('POLYGON((-47.93085 -15.7888, -47.93080 -15.7888, -47.93080 -15.7887, -47.93085 -15.7887, -47.93085 -15.7888))'), 'T009', 'EQ001'),
('PL010', 'Placa Especial 1', 'Operante', '300W', 'Policristalino', 'Q CELLS', 'Q.PEAK DUO', '2022-12-25', 'Normal', ST_GeomFromText('POLYGON((-47.92885 -15.7878, -47.92880 -15.7878, -47.92880 -15.7877, -47.92885 -15.7877, -47.92885 -15.7878))'), 'T010', 'EQ001');

-- Povoamento da tabela Modulo (com dados geoespaciais)
INSERT INTO Modulo (id, nome, status, capacidade, tipo, marca, modelo, data_instalacao, sujidade, poligono, placa_id, equipamento_id) VALUES
('M001', 'Módulo Norte 1', 'Operante', '50W', 'Célula Solar', 'SunPower', 'SPR-E20-327', '2022-02-15', 'não', ST_GeomFromText('POLYGON((-47.92953 -15.79395, -47.92952 -15.79395, -47.92952 -15.79394, -47.92953 -15.79394, -47.92953 -15.79395))'), 'PL001', 'EQ006'),
('M002', 'Módulo Sul 1', 'Operante', '50W', 'Célula Solar', 'LG', 'NeON R', '2022-03-20', 'não', ST_GeomFromText('POLYGON((-47.92983 -15.79475, -47.92982 -15.79475, -47.92982 -15.79474, -47.92983 -15.79474, -47.92983 -15.79475))'), 'PL002', 'EQ006'),
('M003', 'Módulo Leste 1', 'Inoperante', '50W', 'Célula Solar', 'Panasonic', 'VBHN325SJ47', '2022-04-25', 'sim', ST_GeomFromText('POLYGON((-47.92783 -15.79375, -47.92782 -15.79375, -47.92782 -15.79374, -47.92783 -15.79374, -47.92783 -15.79375))'), 'PL003', 'EQ006'),
('M004', 'Módulo Oeste 1', 'Operante', '50W', 'Célula Solar', 'Canadian Solar', 'HiKu', '2022-05-30', 'não', ST_GeomFromText('POLYGON((-47.93083 -15.79275, -47.93082 -15.79275, -47.93082 -15.79274, -47.93083 -15.79274, -47.93083 -15.79275))'), 'PL004', 'EQ006'),
('M005', 'Módulo Central 1', 'Operante', '50W', 'Célula Solar', 'Jinko Solar', 'Cheetah', '2022-07-05', 'não', ST_GeomFromText('POLYGON((-47.92933 -15.79275, -47.92932 -15.79275, -47.92932 -15.79274, -47.92933 -15.79274, -47.92933 -15.79275))'), 'PL005', 'EQ006'),
('M006', 'Módulo Industrial 1', 'Inoperante', '50W', 'Célula Solar', 'Trina Solar', 'Honey', '2022-08-10', 'sim', ST_GeomFromText('POLYGON((-47.92683 -15.79175, -47.92682 -15.79175, -47.92682 -15.79174, -47.92683 -15.79174, -47.92683 -15.79175))'), 'PL006', 'EQ006'),
('M007', 'Módulo Residencial 1', 'Operante', '50W', 'Célula Solar', 'LONGi', 'LR6-72HPH', '2022-09-15', 'não', ST_GeomFromText('POLYGON((-47.92983 -15.79075, -47.92982 -15.79075, -47.92982 -15.79074, -47.92983 -15.79074, -47.92983 -15.79075))'), 'PL007', 'EQ006'),
('M008', 'Módulo Comercial 1', 'Operante', '50W', 'Célula Solar', 'JA Solar', 'JAM6', '2022-10-20', 'não', ST_GeomFromText('POLYGON((-47.92783 -15.78975, -47.92782 -15.78975, -47.92782 -15.78974, -47.92783 -15.78974, -47.92783 -15.78975))'), 'PL008', 'EQ006'),
('M009', 'Módulo Rural 1', 'Inoperante', '50W', 'Célula Solar', 'Risen Energy', 'RDM', '2022-11-25', 'sim', ST_GeomFromText('POLYGON((-47.93083 -15.78875, -47.93082 -15.78875, -47.93082 -15.78874, -47.93083 -15.78874, -47.93083 -15.78875))'), 'PL009', 'EQ006'),
('M010', 'Módulo Especial 1', 'Operante', '50W', 'Célula Solar', 'Q CELLS', 'Q.PEAK L-G5', '2023-01-01', 'não', ST_GeomFromText('POLYGON((-47.92883 -15.78775, -47.92882 -15.78775, -47.92882 -15.78774, -47.92883 -15.78774, -47.92883 -15.78775))'), 'PL010', 'EQ006');

-- Povoamento da tabela Subestacao (com dados geoespaciais)
INSERT INTO Subestacao (id, nome, observacao, status, capacidade, poligono, localizacao, data_criacao, zona_id) VALUES
('SE001', 'Subestação Norte', 'Principal subestação da zona norte', 'Operante', '1MW', ST_GeomFromText('POLYGON((-47.9290 -15.7940, -47.9285 -15.7940, -47.9285 -15.7935, -47.9290 -15.7935, -47.9290 -15.7940))'), ST_GeomFromText('POINT(-47.92875 -15.79375)'), '2022-01-30', 'Z001'),
('SE002', 'Subestação Sul', 'Principal subestação da zona sul', 'Operante', '1.2MW', ST_GeomFromText('POLYGON((-47.9295 -15.7945, -47.9290 -15.7945, -47.9290 -15.7940, -47.9295 -15.7940, -47.9295 -15.7945))'), ST_GeomFromText('POINT(-47.92925 -15.79425)'), '2022-03-05', 'Z002'),
('SE003', 'Subestação Leste', 'Subestação em manutenção', 'Inoperante', '0.8MW', ST_GeomFromText('POLYGON((-47.9275 -15.7935, -47.9270 -15.7935, -47.9270 -15.7930, -47.9275 -15.7930, -47.9275 -15.7935))'), ST_GeomFromText('POINT(-47.92725 -15.79325)'), '2022-04-10', 'Z003'),
('SE004', 'Subestação Oeste', 'Maior subestação da zona oeste', 'Operante', '1.5MW', ST_GeomFromText('POLYGON((-47.9305 -15.7925, -47.9300 -15.7925, -47.9300 -15.7920, -47.9305 -15.7920, -47.9305 -15.7925))'), ST_GeomFromText('POINT(-47.93025 -15.79225)'), '2022-05-15', 'Z004'),
('SE005', 'Subestação Central', 'Subestação mais moderna', 'Operante', '2MW', ST_GeomFromText('POLYGON((-47.9290 -15.7925, -47.9285 -15.7925, -47.9285 -15.7920, -47.9290 -15.7920, -47.9290 -15.7925))'), ST_GeomFromText('POINT(-47.92875 -15.79225)'), '2022-06-20', 'Z005'),
('SE006', 'Subestação Industrial', 'Subestação desativada', 'Inoperante', '1MW', ST_GeomFromText('POLYGON((-47.9265 -15.7915, -47.9260 -15.7915, -47.9260 -15.7910, -47.9265 -15.7910, -47.9265 -15.7915))'), ST_GeomFromText('POINT(-47.92625 -15.79125)'), '2022-07-25', 'Z006'),
('SE007', 'Subestação Residencial', 'Subestação para área residencial', 'Operante', '0.5MW', ST_GeomFromText('POLYGON((-47.9295 -15.7905, -47.9290 -15.7905, -47.9290 -15.7900, -47.9295 -15.7900, -47.9295 -15.7905))'), ST_GeomFromText('POINT(-47.92925 -15.79025)'), '2022-08-30', 'Z007'),
('SE008', 'Subestação Comercial', 'Subestação para área comercial', 'Operante', '0.7MW', ST_GeomFromText('POLYGON((-47.9275 -15.7895, -47.9270 -15.7895, -47.9270 -15.7890, -47.9275 -15.7890, -47.9275 -15.7895))'), ST_GeomFromText('POINT(-47.92725 -15.78925)'), '2022-10-05', 'Z008'),
('SE009', 'Subestação Rural', 'Subestação para área rural', 'Inoperante', '0.3MW', ST_GeomFromText('POLYGON((-47.9305 -15.7885, -47.9300 -15.7885, -47.9300 -15.7880, -47.9305 -15.7880, -47.9305 -15.7885))'), ST_GeomFromText('POINT(-47.93025 -15.78825)'), '2022-11-10', 'Z009'),
('SE010', 'Subestação Especial', 'Subestação com tecnologia avançada', 'Operante', '1.8MW', ST_GeomFromText('POLYGON((-47.9285 -15.7875, -47.9280 -15.7875, -47.9280 -15.7870, -47.9285 -15.7870, -47.9285 -15.7875))'), ST_GeomFromText('POINT(-47.92825 -15.78725)'), '2022-12-15', 'Z010');