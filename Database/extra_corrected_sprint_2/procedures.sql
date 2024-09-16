CREATE OR REPLACE PROCEDURE MANAGE_CP1_ESTADO (
    P_OPERATION IN VARCHAR2,
    P_ID IN CP1_ESTADO.ID%TYPE DEFAULT NULL,
    P_NOME IN CP1_ESTADO.NOME%TYPE DEFAULT NULL
) AS
BEGIN
    CASE P_OPERATION
        WHEN 'INSERT' THEN
            INSERT INTO CP1_ESTADO (
                NOME
            ) VALUES (
                P_NOME
            );
            COMMIT;
        WHEN 'UPDATE' THEN
            UPDATE CP1_ESTADO
            SET
                NOME = P_NOME
            WHERE
                ID = P_ID;
            COMMIT;
        WHEN 'DELETE' THEN
            DELETE FROM CP1_ESTADO
            WHERE
                ID = P_ID;
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Operação inválida.');
    END CASE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Registro não encontrado');
END;
/

CREATE OR REPLACE PROCEDURE MANAGE_CP1_CIDADE (
    P_OPERATION IN VARCHAR2,
    P_ID IN CP1_CIDADE.ID%TYPE DEFAULT NULL,
    P_NOME IN CP1_CIDADE.NOME%TYPE DEFAULT NULL,
    P_ESTADO_ID IN CP1_CIDADE.ESTADO_ID%TYPE DEFAULT NULL
) AS
BEGIN
    CASE P_OPERATION
        WHEN 'INSERT' THEN
            INSERT INTO CP1_CIDADE (
                NOME,
                ESTADO_ID
            ) VALUES (
                P_NOME,
                P_ESTADO_ID
            );
            COMMIT;
        WHEN 'UPDATE' THEN
            UPDATE CP1_CIDADE
            SET
                NOME = P_NOME,
                ESTADO_ID = P_ESTADO_ID
            WHERE
                ID = P_ID;
            COMMIT;
        WHEN 'DELETE' THEN
            DELETE FROM CP1_CIDADE
            WHERE
                ID = P_ID;
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Operação inválida.');
    END CASE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Registro não encontrado');
END;
/

CREATE OR REPLACE PROCEDURE MANAGE_CP1_EMPRESA (
    P_OPERATION IN VARCHAR2,
    P_ID IN CP1_EMPRESA.ID%TYPE DEFAULT NULL,
    P_CNPJ IN CP1_EMPRESA.CNPJ%TYPE DEFAULT NULL,
    P_NOME IN CP1_EMPRESA.NOME%TYPE DEFAULT NULL,
    P_TIPO IN CP1_EMPRESA.TIPO%TYPE DEFAULT NULL,
    P_TELEFONE IN CP1_EMPRESA.TELEFONE%TYPE DEFAULT NULL,
    P_EMAIL IN CP1_EMPRESA.EMAIL%TYPE DEFAULT NULL
) AS
BEGIN
    CASE P_OPERATION
        WHEN 'INSERT' THEN
            INSERT INTO CP1_EMPRESA (
                CNPJ,
                NOME,
                TIPO,
                TELEFONE,
                EMAIL
            ) VALUES (
                P_CNPJ,
                P_NOME,
                P_TIPO,
                P_TELEFONE,
                P_EMAIL
            );
            COMMIT;
        WHEN 'UPDATE' THEN
            UPDATE CP1_EMPRESA
            SET
                CNPJ = P_CNPJ,
                NOME = P_NOME,
                TIPO = P_TIPO,
                TELEFONE = P_TELEFONE,
                EMAIL = P_EMAIL
            WHERE
                ID = P_ID;
            COMMIT;
        WHEN 'DELETE' THEN
            DELETE FROM CP1_EMPRESA
            WHERE
                ID = P_ID;
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Operação inválida.');
    END CASE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Registro não encontrado');
END;
/

CREATE OR REPLACE PROCEDURE MANAGE_CP1_CONVENIO (
    P_OPERATION IN VARCHAR2,
    P_ID IN CP1_CONVENIO.ID%TYPE DEFAULT NULL,
    P_NOME IN CP1_CONVENIO.NOME%TYPE DEFAULT NULL,
    P_VALOR IN CP1_CONVENIO.VALOR%TYPE DEFAULT NULL,
    P_TIPO_SERVICO IN CP1_CONVENIO.TIPO_SERVICO%TYPE DEFAULT NULL,
    P_COBERTURA IN CP1_CONVENIO.COBERTURA%TYPE DEFAULT NULL,
    P_CONTATO IN CP1_CONVENIO.CONTATO%TYPE DEFAULT NULL,
    P_VALIDADE IN CP1_CONVENIO.VALIDADE%TYPE DEFAULT NULL
) AS
BEGIN
    CASE P_OPERATION
        WHEN 'INSERT' THEN
            INSERT INTO CP1_CONVENIO (
                NOME,
                VALOR,
                TIPO_SERVICO,
                COBERTURA,
                CONTATO,
                VALIDADE
            ) VALUES (
                P_NOME,
                P_VALOR,
                P_TIPO_SERVICO,
                P_COBERTURA,
                P_CONTATO,
                P_VALIDADE
            );
            COMMIT;
        WHEN 'UPDATE' THEN
            UPDATE CP1_CONVENIO
            SET
                NOME = P_NOME,
                VALOR = P_VALOR,
                TIPO_SERVICO = P_TIPO_SERVICO,
                COBERTURA = P_COBERTURA,
                CONTATO = P_CONTATO,
                VALIDADE = P_VALIDADE
            WHERE
                ID = P_ID;
            COMMIT;
        WHEN 'DELETE' THEN
            DELETE FROM CP1_CONVENIO
            WHERE
                ID = P_ID;
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Operação inválida.');
    END CASE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Registro não encontrado.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro ao realizar a operação.');
END MANAGE_CP1_CONVENIO;
/

CREATE OR REPLACE PROCEDURE MANAGE_CP1_AREA_ATUACAO (
    P_OPERATION IN VARCHAR2,
    P_ID IN CP1_AREA_ATUACAO.ID%TYPE DEFAULT NULL,
    P_NOME IN CP1_AREA_ATUACAO.NOME%TYPE DEFAULT NULL
) AS
BEGIN
    CASE P_OPERATION
        WHEN 'INSERT' THEN
            INSERT INTO CP1_AREA_ATUACAO (
                NOME
            ) VALUES (
                P_NOME
            );
            COMMIT;
        WHEN 'UPDATE' THEN
            UPDATE CP1_AREA_ATUACAO
            SET
                NOME = P_NOME
            WHERE
                ID = P_ID;
            COMMIT;
        WHEN 'DELETE' THEN
            DELETE FROM CP1_AREA_ATUACAO
            WHERE
                ID = P_ID;
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Operação inválida.');
    END CASE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Registro não encontrado.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro ao realizar a operação.');
END MANAGE_CP1_AREA_ATUACAO;
/

CREATE OR REPLACE PROCEDURE MANAGE_CP1_UNIDADE (
    P_OPERATION IN VARCHAR2,
    P_ID IN CP1_UNIDADE.ID%TYPE DEFAULT NULL,
    P_EMPRESA_ID IN CP1_UNIDADE.EMPRESA_ID%TYPE DEFAULT NULL,
    P_AREA_ATUACAO_ID IN CP1_UNIDADE.AREA_ATUACAO_ID%TYPE DEFAULT NULL,
    P_NOME IN CP1_UNIDADE.NOME%TYPE DEFAULT NULL,
    P_TELEFONE IN CP1_UNIDADE.TELEFONE%TYPE DEFAULT NULL,
    P_EMAIL IN CP1_UNIDADE.EMAIL%TYPE DEFAULT NULL,
    P_TIPO IN CP1_UNIDADE.TIPO%TYPE DEFAULT NULL,
    P_CAPACIDADE IN CP1_UNIDADE.CAPACIDADE%TYPE DEFAULT NULL
) AS
BEGIN
    CASE P_OPERATION
        WHEN 'INSERT' THEN
            INSERT INTO CP1_UNIDADE (
                EMPRESA_ID,
                AREA_ATUACAO_ID,
                NOME,
                TELEFONE,
                EMAIL,
                TIPO,
                CAPACIDADE
            ) VALUES (
                P_EMPRESA_ID,
                P_AREA_ATUACAO_ID,
                P_NOME,
                P_TELEFONE,
                P_EMAIL,
                P_TIPO,
                P_CAPACIDADE
            );
            COMMIT;
        WHEN 'UPDATE' THEN
            UPDATE CP1_UNIDADE
            SET
                EMPRESA_ID = P_EMPRESA_ID,
                AREA_ATUACAO_ID = P_AREA_ATUACAO_ID,
                NOME = P_NOME,
                TELEFONE = P_TELEFONE,
                EMAIL = P_EMAIL,
                TIPO = P_TIPO,
                CAPACIDADE = P_CAPACIDADE
            WHERE
                ID = P_ID;
            COMMIT;
        WHEN 'DELETE' THEN
            DELETE FROM CP1_UNIDADE
            WHERE
                ID = P_ID;
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Operação inválida.');
    END CASE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Registro não encontrado.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro ao realizar a operação.');
END MANAGE_CP1_UNIDADE;
/

CREATE OR REPLACE PROCEDURE MANAGE_CP1_ENDERECO_UNIDADE (
    P_OPERATION IN VARCHAR2,
    P_ID IN CP1_ENDERECO_UNIDADE.ID%TYPE DEFAULT NULL,
    P_UNIDADE_ID IN CP1_ENDERECO_UNIDADE.UNIDADE_ID%TYPE DEFAULT NULL,
    P_RUA IN CP1_ENDERECO_UNIDADE.RUA%TYPE DEFAULT NULL,
    P_NUMERO IN CP1_ENDERECO_UNIDADE.NUMERO%TYPE DEFAULT NULL,
    P_CEP IN CP1_ENDERECO_UNIDADE.CEP%TYPE DEFAULT NULL,
    P_CIDADE_ID IN CP1_ENDERECO_UNIDADE.CIDADE_ID%TYPE DEFAULT NULL
) AS
BEGIN
    CASE P_OPERATION
        WHEN 'INSERT' THEN
            INSERT INTO CP1_ENDERECO_UNIDADE (
                UNIDADE_ID,
                RUA,
                NUMERO,
                CEP,
                CIDADE_ID
            ) VALUES (
                P_UNIDADE_ID,
                P_RUA,
                P_NUMERO,
                P_CEP,
                P_CIDADE_ID
            );
            COMMIT;
        WHEN 'UPDATE' THEN
            UPDATE CP1_ENDERECO_UNIDADE
            SET
                RUA = P_RUA,
                NUMERO = P_NUMERO,
                CEP = P_CEP,
                CIDADE_ID = P_CIDADE_ID
            WHERE
                ID = P_ID;
            COMMIT;
        WHEN 'DELETE' THEN
            DELETE FROM CP1_ENDERECO_UNIDADE
            WHERE
                ID = P_ID;
            COMMIT;
    END CASE;
END MANAGE_CP1_ENDERECO_UNIDADE;
/

CREATE OR REPLACE PROCEDURE MANAGE_CP1_MEDICO (
    P_OPERATION IN VARCHAR2,
    P_ID IN CP1_MEDICO.ID%TYPE DEFAULT NULL,
    P_NOME IN CP1_MEDICO.NOME%TYPE DEFAULT NULL,
    P_TELEFONE IN CP1_MEDICO.TELEFONE%TYPE DEFAULT NULL,
    P_EMAIL IN CP1_MEDICO.EMAIL%TYPE DEFAULT NULL,
    P_ESPECIALIDADE IN CP1_MEDICO.ESPECIALIDADE%TYPE DEFAULT NULL,
    P_CRM IN CP1_MEDICO.CRM%TYPE DEFAULT NULL
) AS
BEGIN
    CASE P_OPERATION
        WHEN 'INSERT' THEN
            INSERT INTO CP1_MEDICO (
                NOME,
                TELEFONE,
                EMAIL,
                ESPECIALIDADE,
                CRM
            ) VALUES (
                P_NOME,
                P_TELEFONE,
                P_EMAIL,
                P_ESPECIALIDADE,
                P_CRM
            );
            COMMIT;
        WHEN 'UPDATE' THEN
            UPDATE CP1_MEDICO
            SET
                NOME = P_NOME,
                TELEFONE = P_TELEFONE,
                EMAIL = P_EMAIL,
                ESPECIALIDADE = P_ESPECIALIDADE,
                CRM = P_CRM
            WHERE
                ID = P_ID;
            COMMIT;
        WHEN 'DELETE' THEN
            DELETE FROM CP1_MEDICO
            WHERE
                ID = P_ID;
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Operação inválida.');
    END CASE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Registro não encontrado.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro ao realizar a operação.');
END MANAGE_CP1_MEDICO;
/

CREATE OR REPLACE PROCEDURE MANAGE_CP1_MEDICO_UNIDADE (
    P_OPERATION IN VARCHAR2,
    P_ID IN CP1_MEDICO_UNIDADE.ID%TYPE DEFAULT NULL,
    P_MEDICO_ID IN CP1_MEDICO_UNIDADE.MEDICO_ID%TYPE DEFAULT NULL,
    P_UNIDADE_ID IN CP1_MEDICO_UNIDADE.UNIDADE_ID%TYPE DEFAULT NULL,
    P_HORARIO_ATENDIMENTO IN CP1_MEDICO_UNIDADE.HORARIO_ATENDIMENTO%TYPE DEFAULT NULL
) AS
BEGIN
    CASE P_OPERATION
        WHEN 'INSERT' THEN
            INSERT INTO CP1_MEDICO_UNIDADE (
                MEDICO_ID,
                UNIDADE_ID,
                HORARIO_ATENDIMENTO
            ) VALUES (
                P_MEDICO_ID,
                P_UNIDADE_ID,
                P_HORARIO_ATENDIMENTO
            );
            COMMIT;
        WHEN 'UPDATE' THEN
            UPDATE CP1_MEDICO_UNIDADE
            SET
                MEDICO_ID = P_MEDICO_ID,
                UNIDADE_ID = P_UNIDADE_ID,
                HORARIO_ATENDIMENTO = P_HORARIO_ATENDIMENTO
            WHERE
                ID = P_ID;
            COMMIT;
        WHEN 'DELETE' THEN
            DELETE FROM CP1_MEDICO_UNIDADE
            WHERE
                ID = P_ID;
            COMMIT;
    END CASE;
END MANAGE_CP1_MEDICO_UNIDADE;
/

CREATE OR REPLACE PROCEDURE MANAGE_CP1_ESTADO_CIVIL (
    P_OPERATION IN VARCHAR2,
    P_ID IN CP1_ESTADO_CIVIL.ID%TYPE DEFAULT NULL,
    P_NOME IN CP1_ESTADO_CIVIL.NOME%TYPE DEFAULT NULL
) AS
BEGIN
    CASE P_OPERATION
        WHEN 'INSERT' THEN
            INSERT INTO CP1_ESTADO_CIVIL (
                NOME
            ) VALUES (
                P_NOME
            );
            COMMIT;
        WHEN 'UPDATE' THEN
            UPDATE CP1_ESTADO_CIVIL
            SET
                NOME = P_NOME
            WHERE
                ID = P_ID;
            COMMIT;
        WHEN 'DELETE' THEN
            DELETE FROM CP1_ESTADO_CIVIL
            WHERE
                ID = P_ID;
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Operação inválida.');
    END CASE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Registro não encontrado.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro ao realizar a operação.');
END MANAGE_CP1_ESTADO_CIVIL;
/

CREATE OR REPLACE PROCEDURE MANAGE_CP1_CLIENTE (
    P_OPERATION IN VARCHAR2,
    P_ID IN CP1_CLIENTE.ID%TYPE DEFAULT NULL,
    P_RG IN CP1_CLIENTE.RG%TYPE DEFAULT NULL,
    P_NOME IN CP1_CLIENTE.NOME%TYPE DEFAULT NULL,
    P_SEXO IN CP1_CLIENTE.SEXO%TYPE DEFAULT NULL,
    P_TELEFONE IN CP1_CLIENTE.TELEFONE%TYPE DEFAULT NULL,
    P_EMAIL IN CP1_CLIENTE.EMAIL%TYPE DEFAULT NULL,
    P_DATA_NASCIMENTO IN CP1_CLIENTE.DATA_NASCIMENTO%TYPE DEFAULT NULL,
    P_CPF IN CP1_CLIENTE.CPF%TYPE DEFAULT NULL,
    P_CONVENIO_ID IN CP1_CLIENTE.CONVENIO_ID%TYPE DEFAULT NULL,
    P_ESTADO_CIVIL_ID IN CP1_CLIENTE.ESTADO_CIVIL_ID%TYPE DEFAULT NULL
) AS
BEGIN
    CASE P_OPERATION
        WHEN 'INSERT' THEN
            INSERT INTO CP1_CLIENTE (
                RG,
                NOME,
                SEXO,
                TELEFONE,
                EMAIL,
                DATA_NASCIMENTO,
                CPF,
                CONVENIO_ID,
                ESTADO_CIVIL_ID
            ) VALUES (
                P_RG,
                P_NOME,
                P_SEXO,
                P_TELEFONE,
                P_EMAIL,
                P_DATA_NASCIMENTO,
                P_CPF,
                P_CONVENIO_ID,
                P_ESTADO_CIVIL_ID
            );
            COMMIT;
        WHEN 'UPDATE' THEN
            UPDATE CP1_CLIENTE
            SET
                RG = P_RG,
                NOME = P_NOME,
                SEXO = P_SEXO,
                TELEFONE = P_TELEFONE,
                EMAIL = P_EMAIL,
                DATA_NASCIMENTO = P_DATA_NASCIMENTO,
                CPF = P_CPF,
                CONVENIO_ID = P_CONVENIO_ID,
                ESTADO_CIVIL_ID = P_ESTADO_CIVIL_ID
            WHERE
                ID = P_ID;
            COMMIT;
        WHEN 'DELETE' THEN
            DELETE FROM CP1_CLIENTE
            WHERE
                ID = P_ID;
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20001, 'Operação inválida.');
    END CASE;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Registro não encontrado.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Erro ao realizar a operação.');
END MANAGE_CP1_CLIENTE;
/

CREATE OR REPLACE PROCEDURE MANAGE_CP1_ENDERECO_CLIENTE (
    P_OPERATION IN VARCHAR2,
    P_ID IN CP1_ENDERECO_CLIENTE.ID%TYPE DEFAULT NULL,
    P_CLIENTE_ID IN CP1_ENDERECO_CLIENTE.CLIENTE_ID%TYPE DEFAULT NULL,
    P_RUA IN CP1_ENDERECO_CLIENTE.RUA%TYPE DEFAULT NULL,
    P_NUMERO IN CP1_ENDERECO_CLIENTE.NUMERO%TYPE DEFAULT NULL,
    P_CEP IN CP1_ENDERECO_CLIENTE.CEP%TYPE DEFAULT NULL,
    P_CIDADE_ID IN CP1_ENDERECO_CLIENTE.CIDADE_ID%TYPE DEFAULT NULL
) AS
BEGIN
    CASE P_OPERATION
        WHEN 'INSERT' THEN
            INSERT INTO CP1_ENDERECO_CLIENTE (
                CLIENTE_ID,
                RUA,
                NUMERO,
                CEP,
                CIDADE_ID
            ) VALUES (
                P_CLIENTE_ID,
                P_RUA,
                P_NUMERO,
                P_CEP,
                P_CIDADE_ID
            );
            COMMIT;
        WHEN 'UPDATE' THEN
            UPDATE CP1_ENDERECO_CLIENTE
            SET
                RUA = P_RUA,
                NUMERO = P_NUMERO,
                CEP = P_CEP,
                CIDADE_ID = P_CIDADE_ID
            WHERE
                ID = P_ID;
            COMMIT;
        WHEN 'DELETE' THEN
            DELETE FROM CP1_ENDERECO_CLIENTE
            WHERE
                ID = P_ID;
            COMMIT;
    END CASE;
END MANAGE_CP1_ENDERECO_CLIENTE;
/

CREATE OR REPLACE PROCEDURE MANAGE_CP1_COMORBIDADE (
    P_OPERATION IN VARCHAR2,
    P_ID IN CP1_COMORBIDADE.ID%TYPE DEFAULT NULL,
    P_NOME IN CP1_COMORBIDADE.NOME%TYPE DEFAULT NULL
) AS
BEGIN
    CASE P_OPERATION
        WHEN 'INSERT' THEN
            INSERT INTO CP1_COMORBIDADE (
                NOME
            ) VALUES (
                P_NOME
            );
            COMMIT;
        WHEN 'UPDATE' THEN
            UPDATE CP1_COMORBIDADE
            SET
                NOME = P_NOME
            WHERE
                ID = P_ID;
            COMMIT;
        WHEN 'DELETE' THEN
            DELETE FROM CP1_COMORBIDADE
            WHERE
                ID = P_ID;
            COMMIT;
    END CASE;
END MANAGE_CP1_COMORBIDADE;
/

CREATE OR REPLACE PROCEDURE MANAGE_CP1_HISTORICO_SAUDE_CLIENTE (
    P_OPERATION IN VARCHAR2,
    P_ID IN CP1_HISTORICO_SAUDE_CLIENTE.ID%TYPE DEFAULT NULL,
    P_CLIENTE_ID IN CP1_HISTORICO_SAUDE_CLIENTE.CLIENTE_ID%TYPE DEFAULT NULL,
    P_COMORBIDADE_ID IN CP1_HISTORICO_SAUDE_CLIENTE.COMORBIDADE_ID%TYPE DEFAULT NULL,
    P_DATA_REGISTRO IN CP1_HISTORICO_SAUDE_CLIENTE.DATA_REGISTRO%TYPE DEFAULT NULL,
    P_FUMA IN CP1_HISTORICO_SAUDE_CLIENTE.FUMA%TYPE DEFAULT NULL,
    P_OBSERVACOES IN CP1_HISTORICO_SAUDE_CLIENTE.OBSERVACOES%TYPE DEFAULT NULL
) AS
BEGIN
    CASE P_OPERATION
        WHEN 'INSERT' THEN
            INSERT INTO CP1_HISTORICO_SAUDE_CLIENTE (
                CLIENTE_ID,
                COMORBIDADE_ID,
                DATA_REGISTRO,
                FUMA,
                OBSERVACOES
            ) VALUES (
                P_CLIENTE_ID,
                P_COMORBIDADE_ID,
                P_DATA_REGISTRO,
                P_FUMA,
                P_OBSERVACOES
            );
            COMMIT;
        WHEN 'UPDATE' THEN
            UPDATE CP1_HISTORICO_SAUDE_CLIENTE
            SET
                COMORBIDADE_ID = P_COMORBIDADE_ID,
                DATA_REGISTRO = P_DATA_REGISTRO,
                FUMA = P_FUMA,
                OBSERVACOES = P_OBSERVACOES
            WHERE
                ID = P_ID;
            COMMIT;
        WHEN 'DELETE' THEN
            DELETE FROM CP1_HISTORICO_SAUDE_CLIENTE
            WHERE
                ID = P_ID;
            COMMIT;
    END CASE;
END MANAGE_CP1_HISTORICO_SAUDE_CLIENTE;
/

CREATE OR REPLACE PROCEDURE MANAGE_CP1_HISTORICO_HOSPITAL_CLIENTE (
    P_OPERATION IN VARCHAR2,
    P_ID IN CP1_HISTORICO_HOSPITAL_CLIENTE.ID%TYPE DEFAULT NULL,
    P_CLIENTE_ID IN CP1_HISTORICO_HOSPITAL_CLIENTE.CLIENTE_ID%TYPE DEFAULT NULL,
    P_DATA_REGISTRO IN CP1_HISTORICO_HOSPITAL_CLIENTE.DATA_REGISTRO%TYPE DEFAULT NULL,
    P_HISTORICO_MEDICO IN CP1_HISTORICO_HOSPITAL_CLIENTE.HISTORICO_MEDICO%TYPE DEFAULT NULL,
    P_EXAMES_REALIZADOS IN CP1_HISTORICO_HOSPITAL_CLIENTE.EXAMES_REALIZADOS%TYPE DEFAULT NULL,
    P_MEDICAMENTOS_PRESCRITOS IN CP1_HISTORICO_HOSPITAL_CLIENTE.MEDICAMENTOS_PRESCRITOS%TYPE DEFAULT NULL,
    P_OBSERVACOES IN CP1_HISTORICO_HOSPITAL_CLIENTE.OBSERVACOES%TYPE DEFAULT NULL
) AS
BEGIN
    CASE P_OPERATION
        WHEN 'INSERT' THEN
            INSERT INTO CP1_HISTORICO_HOSPITAL_CLIENTE (
                CLIENTE_ID,
                DATA_REGISTRO,
                HISTORICO_MEDICO,
                EXAMES_REALIZADOS,
                MEDICAMENTOS_PRESCRITOS,
                OBSERVACOES
            ) VALUES (
                P_CLIENTE_ID,
                P_DATA_REGISTRO,
                P_HISTORICO_MEDICO,
                P_EXAMES_REALIZADOS,
                P_MEDICAMENTOS_PRESCRITOS,
                P_OBSERVACOES
            );
            COMMIT;
        WHEN 'UPDATE' THEN
            UPDATE CP1_HISTORICO_HOSPITAL_CLIENTE
            SET
                DATA_REGISTRO = P_DATA_REGISTRO,
                HISTORICO_MEDICO = P_HISTORICO_MEDICO,
                EXAMES_REALIZADOS = P_EXAMES_REALIZADOS,
                MEDICAMENTOS_PRESCRITOS = P_MEDICAMENTOS_PRESCRITOS,
                OBSERVACOES = P_OBSERVACOES
            WHERE
                ID = P_ID;
            COMMIT;
        WHEN 'DELETE' THEN
            DELETE FROM CP1_HISTORICO_HOSPITAL_CLIENTE
            WHERE
                ID = P_ID;
            COMMIT;
    END CASE;
END MANAGE_CP1_HISTORICO_HOSPITAL_CLIENTE;
/

/* -------------------------------------------------------------------------- */
/*                           Execução das procedures                          */
/* -------------------------------------------------------------------------- */

-- Essas procedures funcionam apenas logo após a criação das tabelas sem ter nenhum insert
BEGIN
    MANAGE_CP1_ESTADO('INSERT', NULL, 'Rio de Janeiro');
    MANAGE_CP1_CIDADE('INSERT', NULL, 'Rio de Janeiro', 1);
    MANAGE_CP1_EMPRESA('INSERT', NULL, '98.765.432/0001-95', 'Empresa XYZ', 'Serviço', '(21) 8765-4321', 'contato@empresaxyz.com');
    MANAGE_CP1_CONVENIO('INSERT', NULL, 'Convenio XYZ', 600.00, 'Saúde', 'Total', 'Contato XYZ', TO_DATE('2025-12-31', 'YYYY-MM-DD'));
    MANAGE_CP1_AREA_ATUACAO('INSERT', NULL, 'Área de Saúde');
    MANAGE_CP1_UNIDADE('INSERT', NULL, 1, 1, 'Unidade Centro', '(21) 1234-5678', 'unidade@empresa.com', 'Filial', 50);
    MANAGE_CP1_ENDERECO_UNIDADE('INSERT', NULL, 1, 'Rua Principal', '123', '01000-000', 1);
    MANAGE_CP1_MEDICO('INSERT', NULL, 'Dr. Maria Oliveira', '(21) 2345-6789', 'joao.silva@medico.com', 'Cardiologia', '123456');
    MANAGE_CP1_MEDICO_UNIDADE('INSERT', NULL, 1, 1, '08:00-12:00');
    MANAGE_CP1_ESTADO_CIVIL('INSERT', NULL, 'Casado');
    MANAGE_CP1_CLIENTE('INSERT', NULL, '12.345.678', 'João Oliveira', 'M', '(21) 3456-7890', 'maria.oliveira@cliente.com', TO_DATE('1985-05-15', 'YYYY-MM-DD'), '123.456.789-00', 1, 1);
    MANAGE_CP1_ENDERECO_CLIENTE('INSERT', NULL, 1, 'Avenida Paulista', '1000', '01310-000', 1);
    MANAGE_CP1_COMORBIDADE('INSERT', NULL, 'Hipertensão');
    MANAGE_CP1_HISTORICO_SAUDE_CLIENTE('INSERT', NULL, 1, 1, TO_DATE('2024-09-01', 'YYYY-MM-DD'), 0, 'Nenhuma observação');
    MANAGE_CP1_HISTORICO_HOSPITAL_CLIENTE('INSERT', NULL, 1, TO_DATE('2024-09-01', 'YYYY-MM-DD'), 'Paciente com histórico de hipertensão.', 'Exames de sangue e pressão arterial.', 'Lisinopril.', 'Acompanhamento regular necessário.');
END;