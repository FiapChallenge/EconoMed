SET SERVEROUTPUT ON;

/* -------------------------------------------------------------------------- */
/*                         2) Desenvolver duas funções                        */
/* -------------------------------------------------------------------------- */

/* Uma função deve ler os dados recebidos e transformá-lo para o
formato JSON. Não use as funções built-in internas de transformação de e para
JSON do banco de dados Oracle */
CREATE OR REPLACE FUNCTION FNC_GERAR_JSON(
    P_CHAVES IN SYS.ODCIVARCHAR2LIST,
    P_VALORES IN SYS.ODCIVARCHAR2LIST
) RETURN CLOB IS
    V_JSON  CLOB := '{';
    V_COUNT PLS_INTEGER := P_CHAVES.COUNT;
BEGIN
    IF P_CHAVES.COUNT != P_VALORES.COUNT THEN
        RAISE VALUE_ERROR;
    END IF;

    FOR I IN 1..V_COUNT LOOP
        V_JSON := V_JSON
                  || '"'
                  || P_CHAVES(I)
                  || '": "'
                  || P_VALORES(I)
                  || '"';
        IF I < V_COUNT THEN
            V_JSON := V_JSON
                      || ', ';
        END IF;
    END LOOP;

    V_JSON := V_JSON
              || '}';
    RETURN V_JSON;
EXCEPTION
    WHEN VALUE_ERROR THEN
        RETURN 'Erro: Número de chaves e valores não correspondem.';
    WHEN NO_DATA_FOUND THEN
        RETURN 'Erro: Dados não encontrados.';
    WHEN OTHERS THEN
        RETURN 'Erro ao gerar JSON: '
               || SQLERRM;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(FNC_GERAR_JSON(SYS.ODCIVARCHAR2LIST('nome', 'idade', 'cidade'), SYS.ODCIVARCHAR2LIST('João', '25', 'São Paulo')));
END;
/

DECLARE
    V_JSON CLOB;
BEGIN
    V_JSON := FNC_GERAR_JSON(SYS.ODCIVARCHAR2LIST('nome'), SYS.ODCIVARCHAR2LIST());
    DBMS_OUTPUT.PUT_LINE(V_JSON);
END;
/

/* Uma função deve substituir um do processamento existente em seu
projeto no formato Função, como por exemplo verificação da complexidade da
senha */
CREATE OR REPLACE FUNCTION CHECK_PASSWORD_COMPLEXITY(
    P_PASSWORD IN VARCHAR2
) RETURN VARCHAR2 IS
    V_MESSAGE VARCHAR2(200);
BEGIN
    IF P_PASSWORD IS NULL THEN
        RAISE NO_DATA_FOUND;
    END IF;
 

    -- Verifica o comprimento da senha
    IF LENGTH(P_PASSWORD) < 8 THEN
        V_MESSAGE := 'A senha é muito curta. Deve ter pelo menos 8 caracteres.';
 
        -- Verifica se há pelo menos uma letra maiúscula
    ELSIF NOT REGEXP_LIKE(P_PASSWORD, '[A-Z]') THEN
        V_MESSAGE := 'A senha deve conter pelo menos uma letra maiúscula.';
 
        -- Verifica se há pelo menos uma letra minúscula
    ELSIF NOT REGEXP_LIKE(P_PASSWORD, '[a-z]') THEN
        V_MESSAGE := 'A senha deve conter pelo menos uma letra minúscula.';
 
        -- Verifica se há pelo menos um número
    ELSIF NOT REGEXP_LIKE(P_PASSWORD, '[0-9]') THEN
        V_MESSAGE := 'A senha deve conter pelo menos um número.';
 
        -- Se todas as condições forem atendidas
    ELSE
        V_MESSAGE := 'A SENHA É VÁLIDA.';
    END IF;

    RETURN V_MESSAGE;
EXCEPTION
    WHEN VALUE_ERROR THEN
        RETURN 'ERRO: FORMATO DE SENHA INVÁLIDO.';
    WHEN NO_DATA_FOUND THEN
        RETURN 'ERRO: SENHA NÃO INFORMADA.';
    WHEN OTHERS THEN
        RETURN 'ERRO DESCONHECIDO: '
               || SQLERRM;
END;
/

DECLARE
    V_MESSAGE VARCHAR2(200);
BEGIN
 
    -- Teste senha válida
    V_MESSAGE := CHECK_PASSWORD_COMPLEXITY('SenhaValida1!');
    DBMS_OUTPUT.PUT_LINE('Teste 1: '
                         || V_MESSAGE);
 
    -- Teste senha muito curta
    V_MESSAGE := CHECK_PASSWORD_COMPLEXITY('Curta1!');
    DBMS_OUTPUT.PUT_LINE('Teste 2: '
                         || V_MESSAGE);
 
    -- Teste senha sem letra maiúscula
    V_MESSAGE := CHECK_PASSWORD_COMPLEXITY('senhaexemplo1!');
    DBMS_OUTPUT.PUT_LINE('Teste 3: '
                         || V_MESSAGE);
 
    -- Teste senha sem letra minúscula
    V_MESSAGE := CHECK_PASSWORD_COMPLEXITY('SENHAEXEMPLO1!');
    DBMS_OUTPUT.PUT_LINE('Teste 4: '
                         || V_MESSAGE);
 
    -- Teste senha sem número
    V_MESSAGE := CHECK_PASSWORD_COMPLEXITY('SenhaSemNumero!');
    DBMS_OUTPUT.PUT_LINE('Teste 5: '
                         || V_MESSAGE);
END;
/

DECLARE
    V_MESSAGE VARCHAR2(200);
BEGIN
    V_MESSAGE := CHECK_PASSWORD_COMPLEXITY(NULL);
    DBMS_OUTPUT.PUT_LINE(V_MESSAGE);
END;
/

/* -------------------------------------------------------------------------- */
/*                         1) Criar 02 procedimentos                          */
/* -------------------------------------------------------------------------- */

/* O primeiro procedimento deve fazer join de duas ou mais tabelas relacionais
e exibir os dados obtidos das tabelas relacionais no formato JSON. Os
dados devem ser transformados do formato relacional para
o formato JSON através de uma função desenvolvida pelo grupo */
CREATE OR REPLACE PROCEDURE PRC_EXIBIR_DADOS_JSON IS
    V_JSON    CLOB;
    V_COUNT   PLS_INTEGER;
    CURSOR C_DADOS IS
    SELECT
        E.NOME     AS EMPRESA_NOME,
        U.NOME     AS UNIDADE_NOME,
        U.TELEFONE,
        U.EMAIL
    FROM
        CP1_EMPRESA E
        JOIN CP1_UNIDADE U
        ON E.ID = U.EMPRESA_ID;
    V_CHAVES  SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('empresa', 'unidade', 'telefone', 'email');
    V_VALORES SYS.ODCIVARCHAR2LIST;
BEGIN
    SELECT
        COUNT(*) INTO V_COUNT
    FROM
        CP1_EMPRESA E
        JOIN CP1_UNIDADE U
        ON E.ID = U.EMPRESA_ID;
    IF V_COUNT = 0 THEN
        RAISE NO_DATA_FOUND;
    END IF;

    FOR REC IN C_DADOS LOOP
        V_VALORES := SYS.ODCIVARCHAR2LIST(REC.EMPRESA_NOME, REC.UNIDADE_NOME, REC.TELEFONE, REC.EMAIL);
        V_JSON := FNC_GERAR_JSON(V_CHAVES, V_VALORES);
        DBMS_OUTPUT.PUT_LINE(V_JSON);
    END LOOP;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Valor inválido.');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum dado encontrado.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro desconhecido: '
                             || SQLERRM);
END;
/

BEGIN
    PRC_EXIBIR_DADOS_JSON;
END;
/

/* O segundo procedimento deve ler os dados de uma tabela e, na mesma
linha, mostrar o valor de uma coluna da linha atual, o valor dessa mesma coluna
na linha anterior e o valor dessa mesma coluna na próxima linha. Caso a linha
anterior ou a próxima linha não existir, apresentar a palavra "Vazio". O relatório
deve ter, pelo menos, cinco linhas de dados. A tabela e a coluna
a ser exibida fica a cargo do grupo */
CREATE OR REPLACE PROCEDURE PRC_COMPARAR_LINHAS IS
    CURSOR C_CLIENTES IS
    SELECT
        NOME
    FROM
        CP1_CLIENTE;
    V_NOME_ATUAL    CP1_CLIENTE.NOME%TYPE;
    V_NOME_ANTERIOR CP1_CLIENTE.NOME%TYPE;
    V_NOME_PROXIMO  CP1_CLIENTE.NOME%TYPE;
BEGIN
    BEGIN
        OPEN C_CLIENTES;
        FETCH C_CLIENTES INTO V_NOME_ATUAL;
        FETCH C_CLIENTES INTO V_NOME_PROXIMO;
        IF C_CLIENTES%NOTFOUND THEN
            RAISE NO_DATA_FOUND;
        END IF;
        WHILE C_CLIENTES%FOUND LOOP
            IF V_NOME_ANTERIOR IS NULL THEN
                DBMS_OUTPUT.PUT_LINE('Anterior: Vazio, Atual: '
                                     || V_NOME_ATUAL
                                     || ', Próximo: '
                                     || V_NOME_PROXIMO);
            ELSE
                DBMS_OUTPUT.PUT_LINE('Anterior: '
                                     || V_NOME_ANTERIOR
                                     || ', Atual: '
                                     || V_NOME_ATUAL
                                     || ', Próximo: '
                                     || V_NOME_PROXIMO);
            END IF;

            V_NOME_ANTERIOR := V_NOME_ATUAL;
            V_NOME_ATUAL := V_NOME_PROXIMO;
            FETCH C_CLIENTES INTO V_NOME_PROXIMO;
        END LOOP;

        IF V_NOME_ATUAL IS NOT NULL THEN
            DBMS_OUTPUT.PUT_LINE('Anterior: '
                                 || V_NOME_ANTERIOR
                                 || ', Atual: '
                                 || V_NOME_ATUAL
                                 || ', Próximo: Vazio');
        END IF;

        CLOSE C_CLIENTES;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Nenhum dado encontrado.');
        WHEN VALUE_ERROR THEN
            DBMS_OUTPUT.PUT_LINE('Erro: Valor inválido.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro desconhecido: '
                                 || SQLERRM);
    END;
END;
/

BEGIN
    PRC_COMPARAR_LINHAS;
END;
/

/* -------------------------------------------------------------------------- */
/*                                 3) Gatilho                                 */
/* -------------------------------------------------------------------------- */

CREATE OR REPLACE TRIGGER TRG_AUDITORIA_EMPRESA AFTER
    INSERT OR UPDATE OR DELETE ON CP1_EMPRESA FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO AUDITORIA_CP1_EMPRESA (
            ID,
            OPERACAO,
            DATA_OPERACAO,
            USUARIO,
            CNPJ_OLD,
            NOME_OLD,
            TIPO_OLD,
            TELEFONE_OLD,
            EMAIL_OLD,
            CNPJ_NEW,
            NOME_NEW,
            TIPO_NEW,
            TELEFONE_NEW,
            EMAIL_NEW
        ) VALUES (
            AUDITORIA_CP1_EMPRESA_SEQ.NEXTVAL,
            'INSERT',
            SYSDATE,
            USER,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            :NEW.CNPJ,
            :NEW.NOME,
            :NEW.TIPO,
            :NEW.TELEFONE,
            :NEW.EMAIL
        );
    ELSIF UPDATING THEN
        INSERT INTO AUDITORIA_CP1_EMPRESA (
            ID,
            OPERACAO,
            DATA_OPERACAO,
            USUARIO,
            CNPJ_OLD,
            NOME_OLD,
            TIPO_OLD,
            TELEFONE_OLD,
            EMAIL_OLD,
            CNPJ_NEW,
            NOME_NEW,
            TIPO_NEW,
            TELEFONE_NEW,
            EMAIL_NEW
        ) VALUES (
            AUDITORIA_CP1_EMPRESA_SEQ.NEXTVAL,
            'UPDATE',
            SYSDATE,
            USER,
            :OLD.CNPJ,
            :OLD.NOME,
            :OLD.TIPO,
            :OLD.TELEFONE,
            :OLD.EMAIL,
            :NEW.CNPJ,
            :NEW.NOME,
            :NEW.TIPO,
            :NEW.TELEFONE,
            :NEW.EMAIL
        );
    ELSIF DELETING THEN
        INSERT INTO AUDITORIA_CP1_EMPRESA (
            ID,
            OPERACAO,
            DATA_OPERACAO,
            USUARIO,
            CNPJ_OLD,
            NOME_OLD,
            TIPO_OLD,
            TELEFONE_OLD,
            EMAIL_OLD,
            CNPJ_NEW,
            NOME_NEW,
            TIPO_NEW,
            TELEFONE_NEW,
            EMAIL_NEW
        ) VALUES (
            AUDITORIA_CP1_EMPRESA_SEQ.NEXTVAL,
            'DELETE',
            SYSDATE,
            USER,
            :OLD.CNPJ,
            :OLD.NOME,
            :OLD.TIPO,
            :OLD.TELEFONE,
            :OLD.EMAIL,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL
        );
    END IF;
END;
/

INSERT INTO CP1_EMPRESA (
    CNPJ,
    NOME,
    TIPO,
    TELEFONE,
    EMAIL
) VALUES (
    '9328434393',
    'Empresa 1',
    'Tipo 1',
    '1234567890',
    'empresa@email.com'
);

UPDATE CP1_EMPRESA
SET
    NOME = 'Empresa 1 Atualizada'
WHERE
    CNPJ = '9328434393';

DELETE FROM CP1_EMPRESA
WHERE
    CNPJ = 9328434393;

SELECT
    *
FROM
    AUDITORIA_CP1_EMPRESA;